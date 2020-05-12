Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB551CEBC6
	for <lists.iommu@lfdr.de>; Tue, 12 May 2020 06:09:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 03D4288994;
	Tue, 12 May 2020 04:09:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z4P6IX0MQ6oF; Tue, 12 May 2020 04:09:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6C6CF88951;
	Tue, 12 May 2020 04:09:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5106FC016F;
	Tue, 12 May 2020 04:09:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D3CA3C016F
 for <iommu@lists.linux-foundation.org>; Tue, 12 May 2020 04:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B96BF87885
 for <iommu@lists.linux-foundation.org>; Tue, 12 May 2020 04:09:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9A7c5DRbDp3i for <iommu@lists.linux-foundation.org>;
 Tue, 12 May 2020 04:09:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BA9EB8507B
 for <iommu@lists.linux-foundation.org>; Tue, 12 May 2020 04:09:09 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id w65so5724999pfc.12
 for <iommu@lists.linux-foundation.org>; Mon, 11 May 2020 21:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=yP6D/ixJy1go9I3dKKTs64wSH22i2lwmmxRms2M5Log=;
 b=rFjrz9rDOYj5kTHRA9iW5hkbpiDEvFt+HIsb9wikLbrAcUSBldbXdKbYpt7EC1eJDu
 vRHSLfztu+FL84B8qSEaDPj8TR5zF5dkvnWMEeUDhSnZ+o/ZnUI+g+/glbL5QZ2l26Ub
 Kf+pFuNVkyX/xujz123lwbFV/+v26ivFpNzRv/JeytkerLige4bEVIcCMmxeDtRlBM8m
 kZUZMWJ0WGaufznZ5GG/vWLyEE2dRwH2mFe4SPaUAVgmMAn5sVG2MoyfJcODZO8umdGA
 2Dmm/WMEM2kcg5U7AGkly7XNwyB+33DyaTkJex9y2wstyBJ+GIEa26FYtJloj3tV8CIr
 oPBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=yP6D/ixJy1go9I3dKKTs64wSH22i2lwmmxRms2M5Log=;
 b=unjIA7FdIDfZbEDrPA6b7RiSO1Klm7hyZ0DYX4iF1y6iypr9F3vAMKejbkIy/8WwSo
 /hAmutBCY7ROIR1m2zFLXf9rf1CeCvRxkM9tMCj+5vYi4Xlk7IZ42SY3O3I/iuJQjv5X
 BvAryy9BE2ZUD9nEsSt8jXLOeUAZ11ksZDmXAsVS+b/Gm04sBUeKIdOiNJHgo+gLR56O
 5TG81mE4PaLqNNZJDWKFREznnm0wkLtRG5/8Ibm/t8D8meq31bMbkIdEg8OwUbA1tcA0
 vW1ni1QVRlZHr/AEwbnAP3hRgWPe08YREli2uB9/wbN8OQYJB8MQd71Pti9v8Y6hyLE3
 4Pfg==
X-Gm-Message-State: AOAM532mg4C1aIe3o3ZdL3J8DIPxIvHUZbAlDSjiZraao3eNrqm1UKk/
 gfMKC81q57NNFTOLh8WBM76B3A==
X-Google-Smtp-Source: ABdhPJwR/mT3M4ET0gUnmGWVdzywReAuxXeomuc5BK5uwflbMkhGQbsFgUJAeMnqFKRm6B3nbWRNqQ==
X-Received: by 2002:a63:3ec4:: with SMTP id l187mr8207696pga.358.1589256549383; 
 Mon, 11 May 2020 21:09:09 -0700 (PDT)
Received: from localhost.localdomain ([240e:362:443:6f00:91af:f25c:441c:7ba4])
 by smtp.gmail.com with ESMTPSA id
 e4sm9471527pge.45.2020.05.11.21.08.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 May 2020 21:09:08 -0700 (PDT)
From: Zhangfei Gao <zhangfei.gao@linaro.org>
To: Joerg Roedel <joro@8bytes.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>,
 jean-philippe <jean-philippe@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, kenneth-lee-2012@foxmail.com,
 Wangzhou <wangzhou1@hisilicon.com>
Subject: [PATCH 0/2] Let pci_fixup_final access iommu_fwnode
Date: Tue, 12 May 2020 12:08:29 +0800
Message-Id: <1589256511-12446-1-git-send-email-zhangfei.gao@linaro.org>
X-Mailer: git-send-email 2.7.4
Cc: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-crypto@vger.kernel.org,
 Zhangfei Gao <zhangfei.gao@linaro.org>, linux-arm-kernel@lists.infradead.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Some platform devices appear as PCI but are
actually on the AMBA bus, and they need fixup in
drivers/pci/quirks.c handling iommu_fwnode.
So calling pci_fixup_final after iommu_fwnode is allocated.

For example: 
Hisilicon platform device need fixup in 
drivers/pci/quirks.c

+static void quirk_huawei_pcie_sva(struct pci_dev *pdev)
+{
+	struct iommu_fwspec *fwspec;
+
+	pdev->eetlp_prefix_path = 1;
+	fwspec = dev_iommu_fwspec_get(&pdev->dev);
+	if (fwspec)
+		fwspec->can_stall = 1;
+}
+
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_HUAWEI, 0xa250, quirk_huawei_pcie_sva);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_HUAWEI, 0xa251, quirk_huawei_pcie_sva);
 

Zhangfei Gao (2):
  iommu/of: Let pci_fixup_final access iommu_fwnode
  ACPI/IORT: Let pci_fixup_final access iommu_fwnode

 drivers/acpi/arm64/iort.c | 1 +
 drivers/iommu/of_iommu.c  | 1 +
 2 files changed, 2 insertions(+)

-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
