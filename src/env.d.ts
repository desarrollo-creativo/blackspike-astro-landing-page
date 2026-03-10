/// <reference types="astro/client" />

interface ImportMetaEnv {
  readonly PUBLIC_EVOLUTION_DOMAIN: string;
  readonly PUBLIC_EVOLUTION_INSTANCE: string;
  readonly PUBLIC_EVOLUTION_TOKEN: string;
}

interface ImportMeta {
  readonly env: ImportMetaEnv;
}
