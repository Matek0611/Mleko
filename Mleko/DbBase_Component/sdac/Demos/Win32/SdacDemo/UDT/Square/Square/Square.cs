using System;
using System.Data;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;
using System.Text;

[Serializable]
[Microsoft.SqlServer.Server.SqlUserDefinedType(Format.Native,
     IsByteOrdered = true, ValidationMethodName = "ValidateSquare")]
public struct Square : INullable
{
    private bool is_Null;
    private Int32 _BaseX;
    private Int32 _BaseY;
    private Int32 _Side;

    public bool IsNull
    {
        get
        {
            return (is_Null);
        }
    }

    public static Square Null
    {
        get
        {
            Square sqr = new Square();
            sqr.is_Null = true;
            return sqr;
        }
    }

    public override string ToString()
    {
        if (this.IsNull)
            return "NULL";
        else
        {
            StringBuilder builder = new StringBuilder();
            builder.Append(_BaseX);
            builder.Append(",");
            builder.Append(_BaseY);
            builder.Append(",");
            builder.Append(_Side);

            return builder.ToString();
        }
    }

    [SqlMethod(OnNullCall = false)]
    public static Square Parse(SqlString s)
    {
        if (s.IsNull)
            return Null;

        Square sqr = new Square();
        string[] xys = s.Value.Split(",".ToCharArray());
        sqr.BaseX = Int32.Parse(xys[0]);
        sqr.BaseY = Int32.Parse(xys[1]);
        sqr.Side = Int32.Parse(xys[2]);

        if (!sqr.ValidateSquare())
            throw new ArgumentException("Invalid BaseX/BaseY/Side values.");
        return sqr;
    }

    public Int32 BaseX
    {
        get
        {
            return this._BaseX;
        }
        set
        {
            Int32 temp = _BaseX;
            _BaseX = value;
            if (!ValidateSquare())
            {
                _BaseX = temp;
                throw new ArgumentException("Invalid BaseX value.");
            }
        }
    }

    public Int32 BaseY
    {
        get
        {
            return this._BaseY;
        }
        set
        {
            Int32 temp = _BaseY;
            _BaseY = value;
            if (!ValidateSquare())
            {
                _BaseY = temp;
                throw new ArgumentException("Invalid BaseY value.");
            }
        }
    }

    public Int32 Side
    {
        get
        {
            return this._Side;
        }
        set
        {
            Int32 temp = _Side;
            _Side = value;
            if (!ValidateSquare())
            {
                _Side = temp;
                throw new ArgumentException("Invalid Side value.");
            }
        }
    }

    private bool ValidateSquare()
    {
        if ((_BaseX >= 0) && (_BaseY >= 0) && (_Side >= 0))
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    [SqlMethod(OnNullCall = false)]
    public Int32 Perimeter()
    {
        return _Side * 4;
    }

    [SqlMethod(OnNullCall = false)]
    public Int32 Area()
    {
        return _Side * _Side;
    }

    [SqlMethod(OnNullCall = false)]
    public void Resize(Int32 Coefficient)
    {
        Side *= Coefficient;
    }

    [SqlMethod(OnNullCall = false)]
    public void Move(Int32 ShiftX, Int32 ShiftY)
    {
        BaseX += ShiftX;
        BaseY += ShiftY;
    }
}