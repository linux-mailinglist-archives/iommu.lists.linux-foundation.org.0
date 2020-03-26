Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0F3193C05
	for <lists.iommu@lfdr.de>; Thu, 26 Mar 2020 10:36:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9AB658849F;
	Thu, 26 Mar 2020 09:36:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Udxj857++wFY; Thu, 26 Mar 2020 09:36:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CEDF1884C2;
	Thu, 26 Mar 2020 09:36:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CA4A9C0177;
	Thu, 26 Mar 2020 09:36:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D4EB7C0177
 for <iommu@lists.linux-foundation.org>; Thu, 26 Mar 2020 09:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D1C3287128
 for <iommu@lists.linux-foundation.org>; Thu, 26 Mar 2020 09:36:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qscDqEYR4BRd for <iommu@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 09:36:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C6E11870EB
 for <iommu@lists.linux-foundation.org>; Thu, 26 Mar 2020 09:36:50 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id m11so939816wrx.10
 for <iommu@lists.linux-foundation.org>; Thu, 26 Mar 2020 02:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ysNCbcUkMZ/CeVGlRLsXlMWw3c/w7czng5uz/uo2h3Q=;
 b=gC/ds2otpbjLj8GvezK3OhoCkeN4UDT+GyqRArXdSJhpqk3wbIedrz9V586H7gBwmC
 OSDEPrvJ4cLJsIDSajYIuZkoXarOPLU7zns2rzC1Kh6QF7NKf86WARKwmZF/uRFho/bF
 +HfW92FErKJlPkMJirrk7aCDIS5U9iVmUSHH0PX89JUBatRi7btYgmJJS+RIVeiuOxP9
 7LqNLIEsiFkruoqfSa6ZJjN5ABNRxvt255A3XqC1nM7buDSpILLm1xf67ZwgD2L3eydO
 0Tz9yOFMXkz3ZvM9RWDMEExxIzW7PKd919aMbyvGze1tsdfCA4SWWa5W2kPfiQg01TOK
 vSFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ysNCbcUkMZ/CeVGlRLsXlMWw3c/w7czng5uz/uo2h3Q=;
 b=k2jMiwJrm+1LVBNKGxy9XLUKolbJU2fWx/UqlHzaGx6fIJ/ovfUHsuZ3VHrvohcCAj
 qQJ4hpIMhTHkSBJeLQ/ArSn7Mmu2KRN9sMdWXdEnuip5oOgjVJUrYCDZitwOBdncYfGC
 8y8CS+4p2mdH2K6chPoScjItKJLhDE2s4ILOPve5Q8Osuv7rhOyoswUW4XZVsU+GZkkn
 W+kE9w4QWRsUiU6lRSMSkFQe14mCRx+4MB7wKAoqucIRrH3QLe2TGXKF7TctuOT4YvTf
 mPskea16isMv/S+VDES27NjrlsbgX/vj/SiYfDAtQXtD3NM6VLO93WZ5dlx6ZJz1LmJN
 s7Bw==
X-Gm-Message-State: ANhLgQ2C1cfopnUwjkneCu8QC/4BRAEiwGvGPTOfMqFAnLRM9zg1OP6F
 GAreynvgp+MzjO67McQLgnGaaj5zdEVQhg==
X-Google-Smtp-Source: ADFU+vtioSAWhaG2weKEaA+L8a5YDbu2l658k5et1mmv4WhzgZuQGA/rQB3o1YKj3xr3BbvSsOMaFA==
X-Received: by 2002:a5d:420e:: with SMTP id n14mr8551724wrq.10.1585215408885; 
 Thu, 26 Mar 2020 02:36:48 -0700 (PDT)
Received: from localhost.localdomain
 ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id u8sm2670165wrn.69.2020.03.26.02.36.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 02:36:48 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH v2 3/3] iommu/virtio: Reject IOMMU page granule larger than
 PAGE_SIZE
Date: Thu, 26 Mar 2020 10:35:58 +0100
Message-Id: <20200326093558.2641019-4-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200326093558.2641019-1-jean-philippe@linaro.org>
References: <20200326093558.2641019-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, mst@redhat.com,
 virtualization@lists.linux-foundation.org, bbhushan2@marvell.com,
 jasowang@redhat.com
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

We don't currently support IOMMUs with a page granule larger than the
system page size. The IOVA allocator has a BUG_ON() in this case, and
VFIO has a WARN_ON().

Removing these obstacles ranges doesn't seem possible without major
changes to the DMA API and VFIO. Some callers of iommu_map(), for
example, want to map multiple page-aligned regions adjacent to each
others for scatter-gather purposes. Even in simple DMA API uses, a call
to dma_map_page() would let the endpoint access neighbouring memory. And
VFIO users cannot ensure that their virtual address buffer is physically
contiguous at the IOMMU granule.

Rather than triggering the IOVA BUG_ON() on mismatched page sizes, abort
the vdomain finalise() with an error message. We could simply abort the
viommu probe(), but an upcoming extension to virtio-iommu will allow
setting different page masks for each endpoint.

Reported-by: Bharat Bhushan <bbhushan2@marvell.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
v1->v2: Move to vdomain_finalise(), improve commit message
---
 drivers/iommu/virtio-iommu.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
index 5eed75cd121f..750f69c49b95 100644
--- a/drivers/iommu/virtio-iommu.c
+++ b/drivers/iommu/virtio-iommu.c
@@ -607,12 +607,22 @@ static struct iommu_domain *viommu_domain_alloc(unsigned type)
 	return &vdomain->domain;
 }
 
-static int viommu_domain_finalise(struct viommu_dev *viommu,
+static int viommu_domain_finalise(struct viommu_endpoint *vdev,
 				  struct iommu_domain *domain)
 {
 	int ret;
+	unsigned long viommu_page_size;
+	struct viommu_dev *viommu = vdev->viommu;
 	struct viommu_domain *vdomain = to_viommu_domain(domain);
 
+	viommu_page_size = 1UL << __ffs(viommu->pgsize_bitmap);
+	if (viommu_page_size > PAGE_SIZE) {
+		dev_err(vdev->dev,
+			"granule 0x%lx larger than system page size 0x%lx\n",
+			viommu_page_size, PAGE_SIZE);
+		return -EINVAL;
+	}
+
 	ret = ida_alloc_range(&viommu->domain_ids, viommu->first_domain,
 			      viommu->last_domain, GFP_KERNEL);
 	if (ret < 0)
@@ -659,7 +669,7 @@ static int viommu_attach_dev(struct iommu_domain *domain, struct device *dev)
 		 * Properly initialize the domain now that we know which viommu
 		 * owns it.
 		 */
-		ret = viommu_domain_finalise(vdev->viommu, domain);
+		ret = viommu_domain_finalise(vdev, domain);
 	} else if (vdomain->viommu != vdev->viommu) {
 		dev_err(dev, "cannot attach to foreign vIOMMU\n");
 		ret = -EXDEV;
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
