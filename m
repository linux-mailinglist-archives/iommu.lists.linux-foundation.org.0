Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1892824790B
	for <lists.iommu@lfdr.de>; Mon, 17 Aug 2020 23:47:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9E24586A0B;
	Mon, 17 Aug 2020 21:47:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id edpNffeAdnWe; Mon, 17 Aug 2020 21:47:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EF7E4868E7;
	Mon, 17 Aug 2020 21:47:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D7DA4C0051;
	Mon, 17 Aug 2020 21:47:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D3780C0051
 for <iommu@lists.linux-foundation.org>; Mon, 17 Aug 2020 21:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C1EDC84B80
 for <iommu@lists.linux-foundation.org>; Mon, 17 Aug 2020 21:47:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WF4q_9pcgCqP for <iommu@lists.linux-foundation.org>;
 Mon, 17 Aug 2020 21:47:00 +0000 (UTC)
X-Greylist: delayed 00:21:54 by SQLgrey-1.7.6
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0BA8284A7E
 for <iommu@lists.linux-foundation.org>; Mon, 17 Aug 2020 21:47:00 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id b22so16121499oic.8
 for <iommu@lists.linux-foundation.org>; Mon, 17 Aug 2020 14:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tcd-ie.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a6SU4e7qioZa1MSGn21iWR1ma/iTKUTYpUuysCGcy14=;
 b=tQ0FE9hLvaMYPBTVoFLMvapqE3NmtNzvVLom8ama2749kqs+FHz9nxs7AHIJO7mDBv
 K8Q+pQ4G/b4TMv1DEEAJUykFiG2bIYGrU3nC3oR7j6f2NPSzKfCcVFaY4kOAcXUttSVT
 FcQd5pxyrvBzc1oQk+/2JMAu6G+p7dtknI9bruysURWXuQybraU9AWYk41P2rQ/Ugs1V
 KCxO0AsJuqMRVrwiHYTBB1bwM8dzGrwTw+I2FuHbRzUP2Mdhb2OLUMXYWcNu2LS9HUSM
 o/iArU0Mr099iYvhHaRGgPLkM2XevIGWNnpUQKOQ1d+f4UwWeBsVd7zpHvgp1Gst8iud
 sCxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a6SU4e7qioZa1MSGn21iWR1ma/iTKUTYpUuysCGcy14=;
 b=pWxP6tC/4u5n5Hs7eanKAooYTd+cr8u9zfhzEuygYzxKxuSaufnTEh9M0YrWpzkXFV
 gMlmK5I02JNSAtdK1tg1k9ULCpriJVnF2NC+kAjJakHMgL6MisAwdV4YxUlNmCaewbvd
 etPQHIGdqbaRPEslSQmgoPg1yNJ+NUYWQIM+bRH8bjCM8PsKXWtjC30r1QdtvqUZwMFg
 q2w5I8I06nJZ0ViaP+Tl5xcDHpQAwIGl4v4VOcCY4Ro29ruivaw6QdMfL1Ko2Yap+By5
 +kH7Z21Pq5wf+vgRraOSCK+I46iS0tPPyFzZG7N2z50XGUulyYG0lBDzhg8GU+S3Ic5T
 b4Fw==
X-Gm-Message-State: AOAM533Y8CfS73hiGgtNFveAb2sbCgIPvD6BVSInph3NOGJOTAd25A51
 w7uUgbQkvQr3k690mymQ41bFp3poVB+vlN1eOaA=
X-Google-Smtp-Source: ABdhPJxLpxYOD9HqJyjPsE+aMSLqEST9f99mfp5IwRRr6pkeOH6GEyp42pRMo63jP9uxCJQN7toCzQ==
X-Received: by 2002:a17:90b:128e:: with SMTP id
 fw14mr14318007pjb.66.1597699202157; 
 Mon, 17 Aug 2020 14:20:02 -0700 (PDT)
Received: from localhost.localdomain (S0106ac17c8c0ce82.vc.shawcable.net.
 [24.87.214.6])
 by smtp.googlemail.com with ESMTPSA id q10sm20733468pfs.75.2020.08.17.14.20.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 14:20:01 -0700 (PDT)
From: Tom Murphy <murphyt7@tcd.ie>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 2/2] Handle init_iova_flush_queue failure in dma-iommu path
Date: Mon, 17 Aug 2020 22:19:50 +0100
Message-Id: <20200817211951.14794-2-murphyt7@tcd.ie>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200817211951.14794-1-murphyt7@tcd.ie>
References: <20200817211951.14794-1-murphyt7@tcd.ie>
MIME-Version: 1.0
Cc: Heiko Stuebner <heiko@sntech.de>, Matthew Rosato <mjrosato@linux.ibm.com>,
 linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Will Deacon <will@kernel.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 linux-samsung-soc@vger.kernel.org, kvm@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, linux-s390@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 virtualization@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 Tom Murphy <murphyt7@tcd.ie>, Kukjin Kim <kgene@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
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

init_iova_flush_queue can fail if we run out of memory. Fall back to no
flush queue if it fails.

Signed-off-by: Tom Murphy <murphyt7@tcd.ie>
---
 drivers/iommu/dma-iommu.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 7433f74d921a..5445e2be08b5 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -356,9 +356,11 @@ static int iommu_dma_init_domain(struct iommu_domain *domain, dma_addr_t base,
 
 	if (!cookie->fq_domain && !iommu_domain_get_attr(domain,
 			DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE, &attr) && attr) {
-		cookie->fq_domain = domain;
-		init_iova_flush_queue(iovad, iommu_dma_flush_iotlb_all,
-				iommu_dma_entry_dtor);
+		if (init_iova_flush_queue(iovad, iommu_dma_flush_iotlb_all,
+				iommu_dma_entry_dtor))
+			pr_warn("iova flush queue initialization failed\n");
+		else
+			cookie->fq_domain = domain;
 	}
 
 	if (!dev)
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
