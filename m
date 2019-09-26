Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D4783BF2F3
	for <lists.iommu@lfdr.de>; Thu, 26 Sep 2019 14:28:26 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B97B1128A;
	Thu, 26 Sep 2019 12:28:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BD5F51189
	for <iommu@lists.linux-foundation.org>;
	Thu, 26 Sep 2019 12:05:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 36A2C8A
	for <iommu@lists.linux-foundation.org>;
	Thu, 26 Sep 2019 12:05:21 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id i1so2456813wro.4
	for <iommu@lists.linux-foundation.org>;
	Thu, 26 Sep 2019 05:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Y07ZnDzexUD9RKC6iDZUZKRTQv+E4IUsmSABNZBPtUg=;
	b=lY6GbUxDwmlppCz8w03u/a/XKs1RebO1CG027tKSNUaMrCOL8ApwY1PKEKNwQiijNv
	Qx3QOqmN3hLxwFtt3LT7xVKr2agK8bWkY853sXPO9eNJVIsw6i9utP3tCp4tavm7gzhy
	wTT9qtjlXC8cVD6LSTof8k3zNzcutc7mSWaRJYHUG9dTLDOPySv/fIsEBuhqwExMK/fW
	9r1l71CQluQ7cA3hnmBCwhvssmlDzU9igERNYlX+KJ+PNq/+7aEknQtP2WaQH+oUBuJG
	6lYZEM4kLnZrtn1gruTHc55ZxCbsOm3700NyJxk+VAk33qizvQkPo9FSAx21M8qnvrqe
	zIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Y07ZnDzexUD9RKC6iDZUZKRTQv+E4IUsmSABNZBPtUg=;
	b=jRt345widbyCwT1ILqozfA0Yj1T+POE+XQ2VSIQgKB8PWy/G77xsndfGR2FidJAYW0
	AzftYzw2atFeyRLaIAaMUa8SmQhCs4d1TpukC9Cf/AX+R5H4OqAxxqx5LY9P8dwVVm7n
	jBlrRYj86rBpiR3Mf9VLNgz/gwPfXA6/lSANotbPUUNfwAe4JRL19/Bq5wwovGYwtLlD
	RZewdKNLExXvBgMbHdYYxIygx7DC0cXu3YSn0h40V2WY5zrp9P0BXmvUNpkwysbNr4ey
	cHbUhtrm6q6kflpvNAtZ/ymulpOuUMZaWBnwCNtaqrhvaoKDYdQD6XTyuu6dyHbLSfwT
	L7xQ==
X-Gm-Message-State: APjAAAXUIONacRxPWGQhSUTK4E+PDPLn/beIcSAPBjEvI62ReRUWl7fm
	B2uxMlFFtfKCBcVkGNRHe/E=
X-Google-Smtp-Source: APXvYqx9k0cZlYHe0P8eggYC/xz9L/TEupr8wVGgeoHdGd9BMRiHHRWA4yfN9cmikfylNkLDgEIz9g==
X-Received: by 2002:a5d:4044:: with SMTP id w4mr2885084wrp.281.1569499519632; 
	Thu, 26 Sep 2019 05:05:19 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
	by smtp.gmail.com with ESMTPSA id
	d193sm5289584wmd.0.2019.09.26.05.05.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Sep 2019 05:05:18 -0700 (PDT)
From: kholk11@gmail.com
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/6] Add support for QCOM IOMMU v2 and 500
Date: Thu, 26 Sep 2019 14:05:10 +0200
Message-Id: <20190926120516.4981-1-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Thu, 26 Sep 2019 12:28:08 +0000
Cc: marijns95@gmail.com, iommu@lists.linux-foundation.org, agross@kernel.org,
	AngeloGioacchino Del Regno <kholk11@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Some Qualcomm Family-B SoCs have got a different version of the QCOM
IOMMU, specifically v2 and 500, which perfectly adhere to the current
qcom_iommu driver, but need some variations due to slightly different
hypervisor behavior.

The personal aim is to upstream MSM8956 as much as possible.

This code has been tested on two Sony phones featuring the Qualcomm
MSM8956 SoC.

AngeloGioacchino Del Regno (6):
  iommu/qcom: Use the asid read from device-tree if specified
  iommu/qcom: Write TCR before TTBRs to fix ASID access behavior
  iommu/qcom: Properly reset the IOMMU context
  iommu/qcom: Add support for AArch64 IOMMU pagetables
  iommu/qcom: Index contexts by asid number to allow asid 0
  iommu/qcom: Add support for QCIOMMUv2 and QCIOMMU-500 secured contexts

 .../devicetree/bindings/iommu/qcom,iommu.txt  |   5 +
 drivers/iommu/qcom_iommu.c                    | 133 ++++++++++++++----
 2 files changed, 111 insertions(+), 27 deletions(-)

-- 
2.21.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
