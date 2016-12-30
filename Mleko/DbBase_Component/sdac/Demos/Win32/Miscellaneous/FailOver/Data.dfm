object DM: TDM
  OldCreateOrder = False
  Left = 185
  Top = 105
  Height = 227
  Width = 284
  object Connection: TMSConnection
    Database = 'master'
    Options.DisconnectedMode = True
    Options.LocalFailover = True
    Pooling = True
    Left = 32
    Top = 32
  end
  object quDetail: TMSQuery
    Connection = Connection
    SQL.Strings = (
      'select * from emp')
    Debug = True
    CachedUpdates = True
    Options.LocalMasterDetail = True
    MasterSource = dsMaster
    MasterFields = 'DEPTNO'
    DetailFields = 'DEPTNO'
    Left = 104
    Top = 88
  end
  object quMaster: TMSQuery
    Connection = Connection
    SQL.Strings = (
      'select * from dept'
      '')
    Debug = True
    CachedUpdates = True
    Left = 104
    Top = 32
  end
  object dsDetail: TDataSource
    DataSet = quDetail
    Left = 136
    Top = 80
  end
  object dsMaster: TDataSource
    DataSet = quMaster
    Left = 136
    Top = 24
  end
  object scCreate: TMSScript
    SQL.Strings = (
      'CREATE TABLE DEPT ('
      '  DEPTNO INT PRIMARY KEY ,'
      '  DNAME VARCHAR(14) ,'
      '  LOC VARCHAR(13)'
      ');'
      ''
      'CREATE TABLE EMP ('
      '  EMPNO INT IDENTITY PRIMARY KEY,'
      '  ENAME VARCHAR(10),'
      '  JOB VARCHAR(9),'
      '  MGR INT,'
      '  HIREDATE DATETIME,'
      '  SAL FLOAT,'
      '  COMM FLOAT,'
      '  DEPTNO INT CONSTRAINT FK_DEPTNO REFERENCES DEPT'
      ');'
      ''
      'INSERT INTO DEPT VALUES (10,'#39'ACCOUNTING'#39','#39'NEW YORK'#39');'
      'INSERT INTO DEPT VALUES (20,'#39'RESEARCH'#39','#39'DALLAS'#39');'
      'INSERT INTO DEPT VALUES (30,'#39'SALES'#39','#39'CHICAGO'#39');'
      'INSERT INTO DEPT VALUES (40,'#39'OPERATIONS'#39','#39'BOSTON'#39');'
      ''
      'INSERT INTO EMP VALUES'
      '('#39'SMITH'#39','#39'CLERK'#39',7902,CAST('#39'12/17/80'#39' AS DATETIME),800,NULL,20);'
      'INSERT INTO EMP VALUES'
      '('#39'ALLEN'#39','#39'SALESMAN'#39',7698,'#39'02/20/81'#39',1600,300,30);'
      'INSERT INTO EMP VALUES'
      '('#39'WARD'#39','#39'SALESMAN'#39',7698,'#39'02/22/81'#39',1250,500,30);'
      'INSERT INTO EMP VALUES'
      '('#39'JONES'#39','#39'MANAGER'#39',7839,'#39'04/02/81'#39',2975,NULL,20);'
      'INSERT INTO EMP VALUES'
      '('#39'MARTIN'#39','#39'SALESMAN'#39',7698,'#39'09/28/81'#39',1250,1400,30);'
      'INSERT INTO EMP VALUES'
      '('#39'BLAKE'#39','#39'MANAGER'#39',7839,'#39'05/01/81'#39',2850,NULL,30);'
      'INSERT INTO EMP VALUES'
      '('#39'CLARK'#39','#39'MANAGER'#39',7839,'#39'06/09/81'#39',2450,NULL,10);'
      'INSERT INTO EMP VALUES'
      '('#39'SCOTT'#39','#39'ANALYST'#39',7566,'#39'07/13/87'#39',3000,NULL,20);'
      'INSERT INTO EMP VALUES'
      '('#39'KING'#39','#39'PRESIDENT'#39',NULL,'#39'11/17/81'#39',5000,NULL,10);'
      'INSERT INTO EMP VALUES'
      '('#39'TURNER'#39','#39'SALESMAN'#39',7698,'#39'09/08/81'#39',1500,0,30);'
      'INSERT INTO EMP VALUES'
      '('#39'ADAMS'#39','#39'CLERK'#39',7788,'#39'07/13/87'#39',1100,NULL,20);'
      'INSERT INTO EMP VALUES'
      '('#39'JAMES'#39','#39'CLERK'#39',7698,'#39'12/03/81'#39',950,NULL,30);'
      'INSERT INTO EMP VALUES'
      '('#39'FORD'#39','#39'ANALYST'#39',7566,'#39'12/03/81'#39',3000,NULL,20);'
      'INSERT INTO EMP VALUES'
      '('#39'MILLER'#39','#39'CLERK'#39',7782,'#39'01/23/82'#39',1300,NULL,10);')
    Connection = Connection
    Left = 200
    Top = 24
  end
  object scDrop: TMSScript
    SQL.Strings = (
      'DROP TABLE EMP;'
      'DROP TABLE DEPT;')
    Connection = Connection
    Left = 200
    Top = 80
  end
end
