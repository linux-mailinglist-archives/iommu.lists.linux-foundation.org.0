Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 458EA465414
	for <lists.iommu@lfdr.de>; Wed,  1 Dec 2021 18:34:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BFC061BF8;
	Wed,  1 Dec 2021 17:34:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OedXhnlrpySS; Wed,  1 Dec 2021 17:34:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2E8B361BEF;
	Wed,  1 Dec 2021 17:34:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0F527C0040;
	Wed,  1 Dec 2021 17:34:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 94EADC003E
 for <iommu@lists.linux-foundation.org>; Wed,  1 Dec 2021 17:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DD8041C60
 for <iommu@lists.linux-foundation.org>; Wed,  1 Dec 2021 17:34:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6FXvIWoOftVm for <iommu@lists.linux-foundation.org>;
 Wed,  1 Dec 2021 17:34:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A10F641C9A
 for <iommu@lists.linux-foundation.org>; Wed,  1 Dec 2021 17:34:38 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 r9-20020a7bc089000000b00332f4abf43fso1297136wmh.0
 for <iommu@lists.linux-foundation.org>; Wed, 01 Dec 2021 09:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CuxPNkV5O41/fQWApY7GOUejWwlTjPj2H7KROS4AAs0=;
 b=k3kt73jz9Ej9cg40gvNq6Sm+28bMVp3RuJ4Ddb3lhBc1oRgSK8ma1vTKCUpLJZqRWe
 lnakREec67NZLL++opcdFNIztfR9ktKc+xnhgk/jvfMI0cU83oe8nD9BdnHlBIH3/nW7
 hSstkNtDEDqH/l7dMUzu5jTFiEwPEseV98TVr7Iy9+uSVgSz+MsB2jm1b2+IDMXsjbq7
 JCW8GAosrVZj28K8PQhOIVjjqGub52B+AgROZrczlPnEdnIVcGpBW8A3/7O8wcE3Gfbx
 cfz8UuVOB3GOLNqB+/dkU1ft91gOHnoK2WzwzG436uJ2ya+BGneuIhHzqzd5f52qNExo
 rwXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CuxPNkV5O41/fQWApY7GOUejWwlTjPj2H7KROS4AAs0=;
 b=1qK4JeHPdt7nalTBub/VaJuUozvnrmfuQCXeNVXga4ogoIwCfnePTTv2BGdtd0T5jo
 TpJv/nvUXo5lTI4HOGuAQwSpEH+0Uzyofs1coNtUsgHMYwdecna3u1n2kvcsU/lKrWCz
 6QlQezaAf3s9e773dmXwZgLeENqU54hH4eppAT4fXxn69q6lX5m7VCYYFeSkqSwH+ii2
 Z9zXVDx5dLKe1cf8Fs0W4Ze+zzK+LIc2rzUqKBMiWhSAN71rOI5zt5vUun/aW1HUMQqp
 CkFwnihxAIYLnIEmSebwY71skGfMxE1HPXNI4VrK3RsFhQMkG7hcArLRNs/uHI08i7hQ
 i3Vg==
X-Gm-Message-State: AOAM530lE7xPgY9UAwbVo3DCP11OVzFOoXmpaqNtXpzxcwvVRhuLYut2
 TeK2yc9DLWUmQ9EPz7WbtciuhQ==
X-Google-Smtp-Source: ABdhPJxjvQH4n954NGc7bg/b/K18KAGI535/RUn+oiM3FYXP2dcDSlVLZQlDmLuXxK3u6G7Lwf/goA==
X-Received: by 2002:a7b:c30e:: with SMTP id k14mr8703977wmj.156.1638380076881; 
 Wed, 01 Dec 2021 09:34:36 -0800 (PST)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id q8sm360023wrx.71.2021.12.01.09.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 09:34:36 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: joro@8bytes.org,
	will@kernel.org,
	mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH v3 2/5] iommu/virtio: Support bypass domains
Date: Wed,  1 Dec 2021 17:33:22 +0000
Message-Id: <20211201173323.1045819-3-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211201173323.1045819-1-jean-philippe@linaro.org>
References: <20211201173323.1045819-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, kevin.tian@intel.com,
 virtualization@lists.linux-foundation.org, pasic@linux.ibm.com,
 iommu@lists.linux-foundation.org, sebastien.boeuf@intel.com
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

The VIRTIO_IOMMU_F_BYPASS_CONFIG feature adds a new flag to the ATTACH
request, that creates a bypass domain. Use it to enable identity
domains.

When VIRTIO_IOMMU_F_BYPASS_CONFIG is not supported by the device, we
currently fail attaching to an identity domain. Future patches will
instead create identity mappings in this case.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 drivers/iommu/virtio-iommu.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
index 80930ce04a16..14dfee76fd19 100644
--- a/drivers/iommu/virtio-iommu.c
+++ b/drivers/iommu/virtio-iommu.c
@@ -71,6 +71,7 @@ struct viommu_domain {
 	struct rb_root_cached		mappings;
 
 	unsigned long			nr_endpoints;
+	bool				bypass;
 };
 
 struct viommu_endpoint {
@@ -587,7 +588,9 @@ static struct iommu_domain *viommu_domain_alloc(unsigned type)
 {
 	struct viommu_domain *vdomain;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
+	if (type != IOMMU_DOMAIN_UNMANAGED &&
+	    type != IOMMU_DOMAIN_DMA &&
+	    type != IOMMU_DOMAIN_IDENTITY)
 		return NULL;
 
 	vdomain = kzalloc(sizeof(*vdomain), GFP_KERNEL);
@@ -630,6 +633,17 @@ static int viommu_domain_finalise(struct viommu_endpoint *vdev,
 	vdomain->map_flags	= viommu->map_flags;
 	vdomain->viommu		= viommu;
 
+	if (domain->type == IOMMU_DOMAIN_IDENTITY) {
+		if (!virtio_has_feature(viommu->vdev,
+					VIRTIO_IOMMU_F_BYPASS_CONFIG)) {
+			ida_free(&viommu->domain_ids, vdomain->id);
+			vdomain->viommu = NULL;
+			return -EOPNOTSUPP;
+		}
+
+		vdomain->bypass = true;
+	}
+
 	return 0;
 }
 
@@ -691,6 +705,9 @@ static int viommu_attach_dev(struct iommu_domain *domain, struct device *dev)
 		.domain		= cpu_to_le32(vdomain->id),
 	};
 
+	if (vdomain->bypass)
+		req.flags |= cpu_to_le32(VIRTIO_IOMMU_ATTACH_F_BYPASS);
+
 	for (i = 0; i < fwspec->num_ids; i++) {
 		req.endpoint = cpu_to_le32(fwspec->ids[i]);
 
@@ -1132,6 +1149,7 @@ static unsigned int features[] = {
 	VIRTIO_IOMMU_F_DOMAIN_RANGE,
 	VIRTIO_IOMMU_F_PROBE,
 	VIRTIO_IOMMU_F_MMIO,
+	VIRTIO_IOMMU_F_BYPASS_CONFIG,
 };
 
 static struct virtio_device_id id_table[] = {
-- 
2.34.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
