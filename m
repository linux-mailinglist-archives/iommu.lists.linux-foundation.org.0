Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E66201E213C
	for <lists.iommu@lfdr.de>; Tue, 26 May 2020 13:49:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 94A0187BCA;
	Tue, 26 May 2020 11:49:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oEhMYDjq0gft; Tue, 26 May 2020 11:49:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1D6F487B60;
	Tue, 26 May 2020 11:49:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E6D34C016F;
	Tue, 26 May 2020 11:49:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DC8A6C016F
 for <iommu@lists.linux-foundation.org>; Tue, 26 May 2020 11:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C99C787BCA
 for <iommu@lists.linux-foundation.org>; Tue, 26 May 2020 11:49:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YYhaI-b3wkVC for <iommu@lists.linux-foundation.org>;
 Tue, 26 May 2020 11:49:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 17A2A87B60
 for <iommu@lists.linux-foundation.org>; Tue, 26 May 2020 11:49:48 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id n15so10105182pfd.0
 for <iommu@lists.linux-foundation.org>; Tue, 26 May 2020 04:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=aQLHuck/H6hUhxdEpWbnpYG+y4hFu1KRyBN1f+7zkW8=;
 b=XirmZKzM+LLXAtNZtlVmQwpy7SRWcMC0TYlRFk6EZGxsqxO252W3y8Nbx4uWD13qJw
 t6QjUR70f+5VrzW+sLYKnb8N8Jp5p/D00A51Ue/rxj4SAEosbp4CeVDJsJSIvPSWRds6
 /mk9A2jA56M7p0pSDTmMSNjOjPAWeCn/FACm5/I5azIw1lC3WMp2WR3XnbKbz9xqsl2/
 ulTm4r8T6NUFIzbvPYU2rllFJGPgCXxuSK2bWEK8Oovu2ZNsAUny/uwETLINLVVqPbNh
 AC58/ztbWIjpzc0KrCChbcnxAr9RxwVmBX0Q6vVr6ifmh4olUxNMQiOLvWnSfEcQiZg/
 3Emw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=aQLHuck/H6hUhxdEpWbnpYG+y4hFu1KRyBN1f+7zkW8=;
 b=Y2uFr853r+ANJNUzMl0J+uSdlLzb78dUFWGO4NCsGf/JkfAnZRtZoSsD8OvE8veRAQ
 O/HPnaemZro+4cjnyDxkODs8iUtE2v/i70aovxzF4iTnuYfVR+lBnt5yxFQF/6eGmyIr
 fi7/1hPeqrxlBZ5rSrPJsw4cQoI/M+FgzPC1Sxw2mRv7ixvXJE2W50ypEENqm+79idWG
 NDCJK1If2iOGfRHXrlK/VDT1qlDKVxRJJtIAhW2D0lEfct0GsaM0RcSE9+AAeZx7aZqV
 IzsBtW2v3clAN/9/8JCQErYJgzWWcLhjktGnss05NojPDjkyhJuosfmr3DgFmQnv1iS+
 GZJw==
X-Gm-Message-State: AOAM533aom49jeyMEzoahBXVA4Svy75tgJjjk6EWyF2VfJhIpy71q0el
 77jAl1gs2s37fGiQ4nEcz3XMVw==
X-Google-Smtp-Source: ABdhPJwWqcev50wczjJKTLuB5KeWjX6Xh40o0PZ2aKsrj0RnXDD5TWs804Gl6GBeG4uho5hk5LIVkg==
X-Received: by 2002:a63:33c6:: with SMTP id z189mr714101pgz.426.1590493787584; 
 Tue, 26 May 2020 04:49:47 -0700 (PDT)
Received: from localhost.localdomain ([45.135.186.9])
 by smtp.gmail.com with ESMTPSA id c12sm15586567pjm.46.2020.05.26.04.49.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 May 2020 04:49:46 -0700 (PDT)
From: Zhangfei Gao <zhangfei.gao@linaro.org>
To: Joerg Roedel <joro@8bytes.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>,
 jean-philippe <jean-philippe@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, kenneth-lee-2012@foxmail.com,
 Wangzhou <wangzhou1@hisilicon.com>
Subject: [PATCH 0/2] Introduce PCI_FIXUP_IOMMU
Date: Tue, 26 May 2020 19:49:07 +0800
Message-Id: <1590493749-13823-1-git-send-email-zhangfei.gao@linaro.org>
X-Mailer: git-send-email 2.7.4
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-crypto@vger.kernel.org, Zhangfei Gao <zhangfei.gao@linaro.org>,
 linux-arm-kernel@lists.infradead.org
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

Some platform devices appear as PCI but are actually on the AMBA bus,
and they need fixup in drivers/pci/quirks.c handling iommu_fwnode.
Here introducing PCI_FIXUP_IOMMU, which is called after iommu_fwnode
is allocated, instead of reusing PCI_FIXUP_FINAL since it will slow
down iommu probing as all devices in fixup final list will be
reprocessed, suggested by Joerg, [1]

For example:
Hisilicon platform device need fixup in
drivers/pci/quirks.c handling fwspec->can_stall, which is introduced in [2]

+static void quirk_huawei_pcie_sva(struct pci_dev *pdev)
+{
+    struct iommu_fwspec *fwspec;
+
+    pdev->eetlp_prefix_path = 1;
+    fwspec = dev_iommu_fwspec_get(&pdev->dev);
+    if (fwspec)
+        fwspec->can_stall = 1;
+}
+
+DECLARE_PCI_FIXUP_IOMMU(PCI_VENDOR_ID_HUAWEI, 0xa250, quirk_huawei_pcie_sva);
+DECLARE_PCI_iFIXUP_IOMMU(PCI_VENDOR_ID_HUAWEI, 0xa251, quirk_huawei_pcie_sva); 

[1] https://www.spinics.net/lists/iommu/msg44591.html
[2] https://www.spinics.net/lists/linux-pci/msg94559.html

Zhangfei Gao (2):
  PCI: Introduce PCI_FIXUP_IOMMU
  iommu: calling pci_fixup_iommu in iommu_fwspec_init

 drivers/iommu/iommu.c             | 4 ++++
 drivers/pci/quirks.c              | 7 +++++++
 include/asm-generic/vmlinux.lds.h | 3 +++
 include/linux/pci.h               | 8 ++++++++
 4 files changed, 22 insertions(+)

-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
