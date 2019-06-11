Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A17C3D4C1
	for <lists.iommu@lfdr.de>; Tue, 11 Jun 2019 19:58:56 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 34632FBD;
	Tue, 11 Jun 2019 17:58:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B0429FAE
	for <iommu@lists.linux-foundation.org>;
	Tue, 11 Jun 2019 17:58:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 68A5579
	for <iommu@lists.linux-foundation.org>;
	Tue, 11 Jun 2019 17:58:49 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id g21so5459191plq.0
	for <iommu@lists.linux-foundation.org>;
	Tue, 11 Jun 2019 10:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7O7Ru3+l0O74nsHSw3FBczx/b+MRdjv8EnNhf40gnd0=;
	b=UMYNlL1JStLpTHwOS2NiKeg51hIerdo4Zd3UgAz+ypA5DvTYyj8rTf1XCvbQAi4k2c
	/lMNDLF4CoFMIRkzKdfalIJm1fKrPhLsHu183fANxaqoHyb8pzP47DOJl++biJWHIEU5
	h3VWtbexf1/ldnGwAbF5UnMFXm4gPPZ8L+9MDMi1l7jJx5einN1e70s0xGEB+D8JLsfT
	jysbQ5FsIgolc/Ke8vsEYlNZwtFn3VzzWg5IVntUHZZ6ATjjXPt6v4w5vzjixEyzSg3j
	jQt5BC32PWnOjw1O/xXO4932ZBf23eNWWUMHCuQBalBUsOJ9pr3+reTbPcbBlYJOCp7W
	rXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7O7Ru3+l0O74nsHSw3FBczx/b+MRdjv8EnNhf40gnd0=;
	b=q0glgLX+hpx7azL06R6Nwji2IOAQkbURWLGEGmx6RH2BhizhphfnLsMFlWQY+j5tcj
	OLTnwtryNGL1viD0ecZzhFgm7lRsCtJMqgmBiRodVlTqCq1Fm2YIUT2982Y1kjr8zRmY
	3H0cnYcYAIK+H2YYGM4k70PwQGCgnK0jt8nRz/Zumj26fv5cKxyvmX87ZEwVV3MAuhH9
	eZJkG2Csr2JaGv+xULfaZ/GXFPGU3quMx02+EnFGj5OSxJ4c8pV8NQbCwKHvGsfar+ef
	RsYxLMT+PIkYsqZHFjf9KSrYk6A4HJB5lXxdzOPV1R6Q+YOeBdG9171GIVcs0afBLsYb
	iDaw==
X-Gm-Message-State: APjAAAUWMbHxLPNH0v73Ff4VeHuwuhJ+jdL2GI60PviBIgx0X1DGlqPB
	Oz5aaLespcd/g9FEm3V+MHU=
X-Google-Smtp-Source: APXvYqyiQwe71OfRqbIpE0WEbsjZnhVJzlFBUwrbKVsHtWtIyzZS9x7MotQhzQpxZuCnEGiRlw4yyA==
X-Received: by 2002:a17:902:106:: with SMTP id 6mr13857570plb.64.1560275928967;
	Tue, 11 Jun 2019 10:58:48 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
	by smtp.gmail.com with ESMTPSA id
	s24sm15991182pfh.133.2019.06.11.10.58.46
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 11 Jun 2019 10:58:46 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] swiotlb: Return consistent SWIOTLB segments/nr_tbl
Date: Tue, 11 Jun 2019 10:58:25 -0700
Message-Id: <20190611175825.572-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190611175825.572-1-f.fainelli@gmail.com>
References: <20190611175825.572-1-f.fainelli@gmail.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	"open list:NETWORKING \[GENERAL\]" <netdev@vger.kernel.org>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	"open list:DMA MAPPING HELPERS" <iommu@lists.linux-foundation.org>,
	"David S. Miller" <davem@davemloft.net>,
	bcm-kernel-feedback-list@broadcom.com, Robin Murphy <robin.murphy@arm.com>,
	Christoph Hellwig <hch@lst.de>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

With a specifically contrived memory layout where there is no physical
memory available to the kernel below the 4GB boundary, we will fail to
perform the initial swiotlb_init() call and set no_iotlb_memory to true.

There are drivers out there that call into swiotlb_nr_tbl() to determine
whether they can use the SWIOTLB. With the right DMA_BIT_MASK() value
for these drivers (say 64-bit), they won't ever need to hit
swiotlb_tbl_map_single() so this can go unoticed and we would be
possibly lying about those drivers.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 kernel/dma/swiotlb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index b2b5c5df273c..e906ef2e6315 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -129,15 +129,17 @@ setup_io_tlb_npages(char *str)
 }
 early_param("swiotlb", setup_io_tlb_npages);
 
+static bool no_iotlb_memory;
+
 unsigned long swiotlb_nr_tbl(void)
 {
-	return io_tlb_nslabs;
+	return unlikely(no_iotlb_memory) ? 0 : io_tlb_nslabs;
 }
 EXPORT_SYMBOL_GPL(swiotlb_nr_tbl);
 
 unsigned int swiotlb_max_segment(void)
 {
-	return max_segment;
+	return unlikely(no_iotlb_memory) ? 0 : max_segment;
 }
 EXPORT_SYMBOL_GPL(swiotlb_max_segment);
 
@@ -160,8 +162,6 @@ unsigned long swiotlb_size_or_default(void)
 	return size ? size : (IO_TLB_DEFAULT_SIZE);
 }
 
-static bool no_iotlb_memory;
-
 void swiotlb_print_info(void)
 {
 	unsigned long bytes = io_tlb_nslabs << IO_TLB_SHIFT;
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
