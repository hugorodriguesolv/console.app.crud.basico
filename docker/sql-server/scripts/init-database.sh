until /opt/mssql-tools/bin/sqlcmd -S sql-server -U sa -P DojoS665 -Q "SELECT 1" &> /dev/null; do
	echo "Aguardando o SQL Server ficar pronto..."
	sleep 5
done

echo "Inicio do processo de criacao e carga da base de dados."
/opt/mssql-tools/bin/sqlcmd -S sql-server -U sa -P DojoS665 -d master -i /tmp/scripts-sql/create-database.sql
echo "Final do processo de criacao e carga da base de dados."