Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 753F042BFB6
	for <lists.iommu@lfdr.de>; Wed, 13 Oct 2021 14:18:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9A85404D6;
	Wed, 13 Oct 2021 12:18:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t3rDOHzVXCUG; Wed, 13 Oct 2021 12:18:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C75E840247;
	Wed, 13 Oct 2021 12:18:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0344CC0027;
	Wed, 13 Oct 2021 12:18:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 76598C0022
 for <iommu@lists.linux-foundation.org>; Wed, 13 Oct 2021 12:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C7D882A95
 for <iommu@lists.linux-foundation.org>; Wed, 13 Oct 2021 12:18:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u7B4mAHHw34K for <iommu@lists.linux-foundation.org>;
 Wed, 13 Oct 2021 12:18:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9E46D82993
 for <iommu@lists.linux-foundation.org>; Wed, 13 Oct 2021 12:18:26 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id r7so7668314wrc.10
 for <iommu@lists.linux-foundation.org>; Wed, 13 Oct 2021 05:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A6DSifL4Yts5kTfmPDnFhvGppRKiGXEIVl3BMBlbPaI=;
 b=XwFWojMRjL9F42Ltl6vOSbC6mDSbQHYslhSn4DrOPGXtgKjRAmyQRQHg+oS1y5eBCM
 0b2XoxV49nrQqpFqmQKqLGqIJz4H1NmQLDoFSMQgJBAhEacqR9xquR5ATjXJNcjxq1C2
 nBdHn/b8lj8lAdJjE6EBdbxr1VIEDoZ3BHHx+zxwZULFrgevtWQisIWMV/SWW/4cAcI/
 38U2kuqYux25OqEPpRHtIw9WXGRddlNG0iJccWCHXtsVcf4zK6dukzux/lP1bKJOqHvL
 uM6LoMGIkTzh6efprmZNExeQ5ohOAMqRZ8vK0OJH9Irn4+6Ht3ebfnX1VbVkpQ6pxtE6
 KhPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A6DSifL4Yts5kTfmPDnFhvGppRKiGXEIVl3BMBlbPaI=;
 b=FEwuW2fZIz+keAQfSvKlsJHWmGVnSH97O9x4wRjfSW1mwk9ReMb9p4MmDNZdPcQahn
 5Xz5J2nT17WrLwIwj71yhAWBbL1nf5MPc+sdZ6ju6n6BOHm3VTFPynBA5GXkL1p1LXRO
 GCQ4Kc0XQ/IqTPsCVZpTJ84AvBXCKBqv/ayLgUyElnEOYIm7KYqPFFKpP+XvottcVm5Z
 mrn6li6me1IhQnjl+n7/Wb8FEUuX6+s+oKxNX4USrJvBU1piouljD8k6dHFwDDABpgpc
 6bDiM2ucJGOFheb1vM7yvDCnIPaZfEUQh0iO6Ej6pI0b231TXGg884OSPua6HQusdKhP
 hWsA==
X-Gm-Message-State: AOAM532XGMLZ8L/wVmmXMzBkuB6uAjay3D0a4ZluH4hXQJxdnK3V5mY1
 dpv7NcIZDejYuR5YBE1WYOz8Zw==
X-Google-Smtp-Source: ABdhPJzuyyIKeSGKy7OC7iVyaV0ex8ARCzd0cydlGVme6JFrJzpiB1GAGb0RVJjN+AeqZunJDQpJLQ==
X-Received: by 2002:a1c:2586:: with SMTP id
 l128mr12429236wml.109.1634127504800; 
 Wed, 13 Oct 2021 05:18:24 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id j13sm4116091wro.97.2021.10.13.05.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 05:18:24 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org
Subject: [PATCH 3/5] iommu/virtio: Sort reserved regions
Date: Wed, 13 Oct 2021 13:10:51 +0100
Message-Id: <20211013121052.518113-4-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211013121052.518113-1-jean-philippe@linaro.org>
References: <20211013121052.518113-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, kevin.tian@intel.com,
 mst@redhat.com, sebastien.boeuf@intel.com, will@kernel.org,
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

To ease identity mapping support, keep the list of reserved regions
sorted.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 drivers/iommu/virtio-iommu.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
index ee8a7afd667b..d63ec4d11b00 100644
--- a/drivers/iommu/virtio-iommu.c
+++ b/drivers/iommu/virtio-iommu.c
@@ -423,7 +423,7 @@ static int viommu_add_resv_mem(struct viommu_endpoint *vdev,
 	size_t size;
 	u64 start64, end64;
 	phys_addr_t start, end;
-	struct iommu_resv_region *region = NULL;
+	struct iommu_resv_region *region = NULL, *next;
 	unsigned long prot = IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO;
 
 	start = start64 = le64_to_cpu(mem->start);
@@ -454,7 +454,12 @@ static int viommu_add_resv_mem(struct viommu_endpoint *vdev,
 	if (!region)
 		return -ENOMEM;
 
-	list_add(&region->list, &vdev->resv_regions);
+	/* Keep the list sorted */
+	list_for_each_entry(next, &vdev->resv_regions, list) {
+		if (next->start > region->start)
+			break;
+	}
+	list_add_tail(&region->list, &next->list);
 	return 0;
 }
 
-- 
2.33.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
