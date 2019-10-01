Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC2DC399E
	for <lists.iommu@lfdr.de>; Tue,  1 Oct 2019 17:57:06 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 595961AC7;
	Tue,  1 Oct 2019 15:57:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8A1711A27
	for <iommu@lists.linux-foundation.org>;
	Tue,  1 Oct 2019 15:56:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0E8F48A9
	for <iommu@lists.linux-foundation.org>;
	Tue,  1 Oct 2019 15:56:48 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id q17so16183771wrx.10
	for <iommu@lists.linux-foundation.org>;
	Tue, 01 Oct 2019 08:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yA8LuJphApJUMeW7EnoqDBSa3QsP9lGr6ZPmbMXfEH8=;
	b=Ghvdl64a96N2aVk9qGQiF4Yf+Rr4r5Mhh7r5bvwp3rGPMahXdzD8ZrdNlIulL98Ysh
	ZoOmKT8pvpQb9eod72lMGffmwHKVXQ4SyKVX1fF8Vo1zLg3iWolfc7VY8X24qj1hk2hs
	+lrDSaNK9Dl+GGa38T7GhRnFiHNnllYhs4Lduq6wtaUTLTww1aho9oLWKWMeWWTnFxSE
	/M/1gXMST6y1gU6IUQiyPkJ4IzVaqdu8OntKxI9ZRIjZlUQQXvgaBxkVthizpx94StCH
	RUSMFlYuVCLAMDsrcn2QoVCYNFR4tzEL4+PVou9YHQkUE1JiDB6Xsym8MFx2s72S4myL
	/5AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yA8LuJphApJUMeW7EnoqDBSa3QsP9lGr6ZPmbMXfEH8=;
	b=MQGbf0iacDz7YCqaaZX1CQMF3zijpYtCeXBiR3DePeLJgyvJtXdchJCFhf4JEJGHGn
	Wt+YDE2Q2TF2M+j+PxXfgO2EkSyPWJtsRMro54xeUZ7xNTGLxFz6HZbYQKd3laEKHufT
	0+upYW2yrEQeO3eptRqOMUUfGcjvbdzO/UHv2qmjPMgLqb1k1pULP3WQBC+OKiJigWMx
	yr8RMz0RvuWihdm7i2p1gVsh+0WgoFINw8EBfu3tiHA3jBwjErvy021Q1BxQVAX2yvcS
	SbEEaHVsR2oCHT/S9sHlJrNAi/8vBCPCajXK0chONmrIK0QPn4Zle8kT8gr90MeWgTMe
	1erA==
X-Gm-Message-State: APjAAAW4LwReM/QX/ufSPQ+4lJa8IX83ZBUtf6uPDZ1INYgnlF7tKAdD
	xL1Orc6MAvj2FgDg/WqDYGw=
X-Google-Smtp-Source: APXvYqwfEElz17GkD+jenA0SuVWri/ZG4JGXiJfIVeUnaoyAt3RrOOfUJtsoccNlQ51DQB6hH/Cz1w==
X-Received: by 2002:adf:fe05:: with SMTP id n5mr19974278wrr.355.1569945407469; 
	Tue, 01 Oct 2019 08:56:47 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
	by smtp.gmail.com with ESMTPSA id
	h63sm6209136wmf.15.2019.10.01.08.56.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Oct 2019 08:56:46 -0700 (PDT)
From: kholk11@gmail.com
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 0/7] Add support for QCOM IOMMU v2 and 500
Date: Tue,  1 Oct 2019 17:56:34 +0200
Message-Id: <20191001155641.37117-1-kholk11@gmail.com>
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
 drivers/firmware/qcom_scm.h.rej               |  13 ++
 drivers/iommu/qcom_iommu.c                    | 134 ++++++++++++++----
 include/linux/qcom_scm.h                      |   2 +
 include/linux/qcom_scm.h.rej                  |  19 +++
 9 files changed, 177 insertions(+), 28 deletions(-)
 create mode 100644 drivers/firmware/qcom_scm.h.rej
 create mode 100644 include/linux/qcom_scm.h.rej

-- 
2.21.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
