Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 494CA3139BF
	for <lists.iommu@lfdr.de>; Mon,  8 Feb 2021 17:41:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5D0C486D9F;
	Mon,  8 Feb 2021 16:41:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DCFtjcPsHncq; Mon,  8 Feb 2021 16:41:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0B8E486DB3;
	Mon,  8 Feb 2021 16:41:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EAF4DC013A;
	Mon,  8 Feb 2021 16:41:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2A4F8C0891
 for <iommu@lists.linux-foundation.org>; Mon,  8 Feb 2021 16:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 195BA86A6F
 for <iommu@lists.linux-foundation.org>; Mon,  8 Feb 2021 16:41:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m4evhXctAdAy for <iommu@lists.linux-foundation.org>;
 Mon,  8 Feb 2021 16:41:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 56616869A4
 for <iommu@lists.linux-foundation.org>; Mon,  8 Feb 2021 16:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ShNO03k9Kv2DlrWz4TqF7mUu2Ro0m37vTR18y0YWCj8=; b=I8VRqnr7bITl46JEFLdfgGjjby
 UhpSmIIwGfFxhamtNxIrjlIMpX7zbCU/t174zqIiy9HH95PuAcQkrV1Ci5geM02BaZfPrsOenwZwN
 uyMfgiTlJGSehRNWQKIy7QaMzqlYf/p1ejAJPnLWz68xr+q7FeMe53iOJqcTix/ugyNbyZEFG5zpZ
 8zOQblq5uL5u1ZzddRl9grpkLn30NTz8EXzhopq3I4xL1mw5CBZJYJSuREiwcBBxKvrpN9+PDoKzZ
 C9MqVOxbqRcQ8HWSuKSkbjo/iWJgcPcz9d9mX+QENZc5i/bW3D/+kVA2qZvLNlNjrN6hljoLPCQLo
 VkzZlOhA==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1l99at-0000Cr-5U; Mon, 08 Feb 2021 18:40:59 +0200
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, joro@8bytes.org,
 will@kernel.org, robh+dt@kernel.org, frowand.list@gmail.com,
 robin.murphy@arm.com
Subject: [RFC PATCH 7/8] drm/tegra: Support context isolation
Date: Mon,  8 Feb 2021 18:38:47 +0200
Message-Id: <20210208163848.2504291-8-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210208163848.2504291-1-mperttunen@nvidia.com>
References: <20210208163848.2504291-1-mperttunen@nvidia.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

For engines that support context isolation, allocate a context when
opening a channel, and set up stream ID offset and context fields
when submitting a job.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/tegra/drm.h         |  1 +
 drivers/gpu/drm/tegra/uapi.h        |  1 +
 drivers/gpu/drm/tegra/uapi/submit.c | 13 +++++++++++
 drivers/gpu/drm/tegra/uapi/uapi.c   | 34 +++++++++++++++++++++++++++--
 4 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 1af57c2016eb..5d3903372041 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -81,6 +81,7 @@ struct tegra_drm_client_ops {
 	int (*submit)(struct tegra_drm_context *context,
 		      struct drm_tegra_submit *args, struct drm_device *drm,
 		      struct drm_file *file);
+	int (*get_streamid_offset)(struct tegra_drm_client *client);
 };
 
 int tegra_drm_submit(struct tegra_drm_context *context,
diff --git a/drivers/gpu/drm/tegra/uapi.h b/drivers/gpu/drm/tegra/uapi.h
index 5c422607e8fa..8efb30bbdb4b 100644
--- a/drivers/gpu/drm/tegra/uapi.h
+++ b/drivers/gpu/drm/tegra/uapi.h
@@ -26,6 +26,7 @@ struct tegra_drm_file {
 struct tegra_drm_channel_ctx {
 	struct tegra_drm_client *client;
 	struct host1x_channel *channel;
+	struct host1x_context *context;
 	struct xarray mappings;
 };
 
diff --git a/drivers/gpu/drm/tegra/uapi/submit.c b/drivers/gpu/drm/tegra/uapi/submit.c
index 8633844ae3d7..1d0dd28af99f 100644
--- a/drivers/gpu/drm/tegra/uapi/submit.c
+++ b/drivers/gpu/drm/tegra/uapi/submit.c
@@ -337,6 +337,9 @@ static void release_job(struct host1x_job *job)
 	struct tegra_drm_submit_data *job_data = job->user_data;
 	u32 i;
 
+	if (job->context)
+		host1x_context_put(job->context);
+
 	for (i = 0; i < job_data->num_used_mappings; i++)
 		tegra_drm_mapping_put(job_data->used_mappings[i].mapping);
 
@@ -398,6 +401,16 @@ int tegra_drm_ioctl_channel_submit(struct drm_device *drm, void *data,
 	job->release = release_job;
 	job->timeout = 10000;
 
+	if (ctx->context && ctx->client->ops->get_streamid_offset) {
+		int offset = ctx->client->ops->get_streamid_offset(ctx->client);
+
+		if (offset >= 0) {
+			job->context = ctx->context;
+			job->engine_streamid_offset = offset;
+			host1x_context_get(job->context);
+		}
+	}
+
 	/*
 	 * job_data is now part of job reference counting, so don't release
 	 * it from here.
diff --git a/drivers/gpu/drm/tegra/uapi/uapi.c b/drivers/gpu/drm/tegra/uapi/uapi.c
index d503b5e817c4..e2e0c88b858d 100644
--- a/drivers/gpu/drm/tegra/uapi/uapi.c
+++ b/drivers/gpu/drm/tegra/uapi/uapi.c
@@ -49,6 +49,9 @@ static void tegra_drm_channel_ctx_close(struct tegra_drm_channel_ctx *ctx)
 	unsigned long mapping_id;
 	struct tegra_drm_mapping *mapping;
 
+	if (ctx->context)
+		host1x_context_put(ctx->context);
+
 	xa_for_each(&ctx->mappings, mapping_id, mapping)
 		tegra_drm_mapping_put(mapping);
 
@@ -82,6 +85,7 @@ void tegra_drm_uapi_close_file(struct tegra_drm_file *file)
 int tegra_drm_ioctl_channel_open(struct drm_device *drm, void *data,
 				 struct drm_file *file)
 {
+	struct host1x *host = tegra_drm_to_host1x(drm->dev_private);
 	struct tegra_drm_file *fpriv = file->driver_priv;
 	struct tegra_drm *tegra = drm->dev_private;
 	struct drm_tegra_channel_open *args = data;
@@ -116,10 +120,29 @@ int tegra_drm_ioctl_channel_open(struct drm_device *drm, void *data,
 		}
 	}
 
+	/* Only allocate context if the engine supports context isolation. */
+	if (client->ops->get_streamid_offset &&
+	    client->ops->get_streamid_offset(client) >= 0) {
+		ctx->context =
+			host1x_context_alloc(host, get_task_pid(current, PIDTYPE_TGID));
+		if (IS_ERR(ctx->context)) {
+			if (PTR_ERR(ctx->context) != -EOPNOTSUPP) {
+				err = PTR_ERR(ctx->context);
+				goto put_channel;
+			} else {
+				/*
+				 * OK, HW does not support contexts or contexts
+				 * are disabled.
+				 */
+				ctx->context = NULL;
+			}
+		}
+	}
+
 	err = xa_alloc(&fpriv->contexts, &args->channel_ctx, ctx,
 		       XA_LIMIT(1, U32_MAX), GFP_KERNEL);
 	if (err < 0)
-		goto put_channel;
+		goto put_context;
 
 	ctx->client = client;
 	xa_init_flags(&ctx->mappings, XA_FLAGS_ALLOC1);
@@ -128,6 +151,9 @@ int tegra_drm_ioctl_channel_open(struct drm_device *drm, void *data,
 
 	return 0;
 
+put_context:
+	if (ctx->context)
+		host1x_context_put(ctx->context);
 put_channel:
 	host1x_channel_put(ctx->channel);
 free_ctx:
@@ -188,7 +214,11 @@ int tegra_drm_ioctl_channel_map(struct drm_device *drm, void *data,
 		goto unlock;
 	}
 
-	mapping->dev = ctx->client->base.dev;
+	if (ctx->context)
+		mapping->dev = &ctx->context->dev;
+	else
+		mapping->dev = ctx->client->base.dev;
+
 	mapping->bo = &container_of(gem, struct tegra_bo, gem)->base;
 
 	if (!iommu_get_domain_for_dev(mapping->dev) ||
-- 
2.30.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
