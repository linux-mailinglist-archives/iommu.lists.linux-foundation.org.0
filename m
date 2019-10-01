Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 54650C4364
	for <lists.iommu@lfdr.de>; Wed,  2 Oct 2019 00:02:26 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C4CF32349;
	Tue,  1 Oct 2019 22:02:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 47EF81A88
	for <iommu@lists.linux-foundation.org>;
	Tue,  1 Oct 2019 22:02:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id CBB313D0
	for <iommu@lists.linux-foundation.org>;
	Tue,  1 Oct 2019 22:02:09 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id v17so4812648wml.4
	for <iommu@lists.linux-foundation.org>;
	Tue, 01 Oct 2019 15:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vxOgO1AYxiKtqziwjTRehHOuCKDD+E2RIq5SeYCl3mM=;
	b=SU9Sh4cU7wRN8bqgDY//SM9ohtN1UTI8c3FeaRhzaPiAI/Z3Ox2fIFRV7k/qFBb+BJ
	A/wgHFPFmGijMCQPTb40qtRtod8QZWOXIITDamOaRdntJulrfHcwhDoC43DoTc9ZBTAa
	AThhNxb8J/6yvNQWVvtOfbEOH5Uph6/n5eX2rkW81HNUzYTuup5LY7VpbZ1WTdct++/3
	M/BGiBFf8ClDnNzni2xXtj86sT8Jqa/FbqY7BGQf4/LeXz1o9JxTUJ1j3R8nek+g4qsW
	lYcjK5jU2SC9CiGJV67awvwFiJqKjTF0ZcALCyu9e9fqsMMUnpe86i+GY5as9kMr3/37
	RUag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vxOgO1AYxiKtqziwjTRehHOuCKDD+E2RIq5SeYCl3mM=;
	b=YZnm+8hBPIVOeGKG8qxVog4AQrxLb7XcTCvr2QZu7jR+lqpEW54ZFpBZU8tZUwxTLC
	5t2SvmFySVes4rJk4d9J0sflTpkHSKo5DZhwuA/4ifwsurOax7GDiG3ragHkfemwEDn2
	xn2qiSUPXMWLwhlev8nxi5ku2jU5TUreF4D/8DXyqznW13ac5uuvVkC38y1ZISrVRVFf
	raHBKuKnDJSVJr34q/qWV28AOEWglz+DvyI211SWCEUoDCNr+xCQEDu3O6KS32Tm7+I1
	mLn3IvxRrSvkjlcMaTpVrI/F0TZEwBWTUjuaZAsiuwoRRapXYMkhVS1DlzveuIOEl6PQ
	8V3A==
X-Gm-Message-State: APjAAAWU1ktHoSmUe6ummZiCbIOA1/XY3OoD5Y+JgdmF5irj8tiGE0zH
	P8jWqDBv+KU7qUbf5cyxXPQ=
X-Google-Smtp-Source: APXvYqyQo+tkOe830VTLlZ6xjCWNwUMwKXL+NYcNp2OCi4AegVagJTbLGvXiuLRYacPa7GV9+yI8Dg==
X-Received: by 2002:a1c:9d52:: with SMTP id g79mr172077wme.91.1569967328289;
	Tue, 01 Oct 2019 15:02:08 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
	by smtp.gmail.com with ESMTPSA id
	v16sm21811219wrt.12.2019.10.01.15.02.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Oct 2019 15:02:07 -0700 (PDT)
From: kholk11@gmail.com
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 0/7] Add support for QCOM IOMMU v2 and 500
Date: Wed,  2 Oct 2019 00:01:58 +0200
Message-Id: <20191001220205.6423-1-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: marijns95@gmail.com, iommu@lists.linux-foundation.org, agross@kernel.org,
	kholk11@gmail.com
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

Changes in v2:
- Fixed optional properties placement in documentation

Changes in v3:
- Rebased onto linux-next 01/10/2019
- Added missing SCM commit (required by the AArch64 PT switch support)

Changes in v4:
- Removed rej files from the SCM patch (I'm truly sorry for the noise...)

Angelo G. Del Regno (1):
  firmware: qcom: scm: Add function to set IOMMU pagetable addressing

AngeloGioacchino Del Regno (6):
  iommu/qcom: Use the asid read from device-tree if specified
  iommu/qcom: Write TCR before TTBRs to fix ASID access behavior
  iommu/qcom: Properly reset the IOMMU context
  iommu/qcom: Add support for AArch64 IOMMU pagetables
  iommu/qcom: Index contexts by asid number to allow asid 0
  iommu/qcom: Add support for QCIOMMUv2 and QCIOMMU-500 secured contexts

 .../devicetree/bindings/iommu/qcom,iommu.txt  |   5 +
 drivers/firmware/qcom_scm-32.c                |   6 +
 drivers/firmware/qcom_scm-64.c                |  15 ++
 drivers/firmware/qcom_scm.c                   |   7 +
 drivers/firmware/qcom_scm.h                   |   4 +
 drivers/iommu/qcom_iommu.c                    | 134 ++++++++++++++----
 include/linux/qcom_scm.h                      |   2 +
 7 files changed, 145 insertions(+), 28 deletions(-)

-- 
2.21.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
