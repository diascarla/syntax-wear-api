import { buildApp } from "./app";

const PORT = parseInt(process.env.PORT ?? "3000");

const startServer = async () => {
	const app = await buildApp();

	try {
		await app.listen({ port: PORT, host: '0.0.0.0' });
		console.log(`🚀 Server running at http://localhost:${PORT}`);
		console.log(`📚 API Docs at http://localhost:${PORT}/api-docs`);
	} catch (err) {
		app.log.error(err);
		process.exit(1);
	}
};

startServer();
