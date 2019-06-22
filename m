Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9414F3B5
	for <lists.iommu@lfdr.de>; Sat, 22 Jun 2019 06:38:13 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 32C5914B0;
	Sat, 22 Jun 2019 04:38:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 22E0014AA
	for <iommu@lists.linux-foundation.org>;
	Sat, 22 Jun 2019 04:38:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 099BC224
	for <iommu@lists.linux-foundation.org>;
	Sat, 22 Jun 2019 04:38:07 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id f25so4286764pgv.10
	for <iommu@lists.linux-foundation.org>;
	Fri, 21 Jun 2019 21:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=UVjWSqB/7Lf0YYDkLp4LkWZ43zZWpfRLYB/XiGKhRY8=;
	b=etSM9Q7XVXL92xsCiw4I+XZtigD2/HnHeL8qQ90VPhdsEwiEymS+PrgqSSVXRjrzY+
	sg164nUnohbeF0Q3nvvg2DimOz8gb+sTKIrELJBL5z1OSxlcQuZ/Pw5nLSZTMB03XEYg
	blTNS6arcQYH3VsASTVi3/FuM0lXEh6PuCY40tGi2UjHGg6frNymobGN4UD+TwYXeRRn
	7lw+dUfNUCXQm/2Rm1yCIkvBn9f3mGA3SwmeJ0pFR/534Uh0KIXBK0SWAL2VYMRwc5nw
	FBYwl1KydxJkteEJJDMJw0iD/GR37c2Pfy6rwCIe4n25O++3cX8KR15Q+W89OLQxfn0O
	/5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UVjWSqB/7Lf0YYDkLp4LkWZ43zZWpfRLYB/XiGKhRY8=;
	b=n5M22s1R8jbTzVVlnnCGvVvi01sjTezgWgiwmqRQiBQ+FNEmefgkd57fTxqAaaP8EP
	ydUgiDFLKnD0vuMdb5evstLCSPBs/250vlX3zXmadPEZ636luCB9FB9pBqKXmWE0VvbH
	j0ml9Xd9HtjMKubnoyDKr/cK8uCZVeTAQI+H/77+tsPpCFe0CrU9F3gYk5JUBRk0rIa/
	5utV9OhRdEbtCPHBsQwEbe70IuT/tT92YPJKAonYaNfR/ynF3PZYgGF0QjAkWECPaDb6
	VfRlljaexhTB3ks7hRXtMQ50NUpUmlOZzJj3eGQWomV0PP8WDDSK5K+jViVPj4B57R/P
	te5w==
X-Gm-Message-State: APjAAAUzWv5tvosIxl8V0HKQHlBjEqv1oOaSpjtIe3o8WKI9Eked0I2f
	C3Rlv8Iu9GzpFafJ1ymf5wA=
X-Google-Smtp-Source: APXvYqzRsqXCbeug24DzwsENw7/g/zBC/20NAsJBzRau4julnTvQAbQ9Ks3XyflyGM1L6QEBiQoF6g==
X-Received: by 2002:a65:620a:: with SMTP id d10mr21909649pgv.42.1561178287301; 
	Fri, 21 Jun 2019 21:38:07 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
	[216.228.112.22])
	by smtp.gmail.com with ESMTPSA id r2sm6338586pfl.67.2019.06.21.21.38.06
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 21 Jun 2019 21:38:06 -0700 (PDT)
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: joro@8bytes.org
Subject: [PATCH] iommu/dma: Fix calculation overflow in __finalise_sg()
Date: Fri, 21 Jun 2019 21:38:14 -0700
Message-Id: <20190622043814.5003-1-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, robin.murphy@arm.com,
	linux-kernel@vger.kernel.org
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

The max_len is a u32 type variable so the calculation on the
left hand of the last if-condition will potentially overflow
when a cur_len gets closer to UINT_MAX -- note that there're
drivers setting max_seg_size to UINT_MAX:
  drivers/dma/dw-edma/dw-edma-core.c:745:
    dma_set_max_seg_size(dma->dev, U32_MAX);
  drivers/dma/dma-axi-dmac.c:871:
    dma_set_max_seg_size(&pdev->dev, UINT_MAX);
  drivers/mmc/host/renesas_sdhi_internal_dmac.c:338:
    dma_set_max_seg_size(dev, 0xffffffff);
  drivers/nvme/host/pci.c:2520:
    dma_set_max_seg_size(dev->dev, 0xffffffff);

So this patch just casts the cur_len in the calculation to a
size_t type to fix the overflow issue, as it's not necessary
to change the type of cur_len after all.

Fixes: 809eac54cdd6 ("iommu/dma: Implement scatterlist segment merging")
Cc: stable@vger.kernel.org
Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 drivers/iommu/dma-iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index a9f13313a22f..676b7ecd451e 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -764,7 +764,7 @@ static int __finalise_sg(struct device *dev, struct scatterlist *sg, int nents,
 		 * - and wouldn't make the resulting output segment too long
 		 */
 		if (cur_len && !s_iova_off && (dma_addr & seg_mask) &&
-		    (cur_len + s_length <= max_len)) {
+		    ((size_t)cur_len + s_length <= max_len)) {
 			/* ...then concatenate it with the previous one */
 			cur_len += s_length;
 		} else {
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
