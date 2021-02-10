Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B88F316AD6
	for <lists.iommu@lfdr.de>; Wed, 10 Feb 2021 17:13:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38F876F4F3
	for <lists.iommu@lfdr.de>; Wed, 10 Feb 2021 16:13:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OwnFw2XHG9HI for <lists.iommu@lfdr.de>;
	Wed, 10 Feb 2021 16:13:46 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
	id 6D1A46F6A8; Wed, 10 Feb 2021 16:13:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8524060071;
	Wed, 10 Feb 2021 16:13:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 441CDC0174;
	Wed, 10 Feb 2021 16:13:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 00B40C013A
 for <iommu@lists.linux-foundation.org>; Wed, 10 Feb 2021 16:13:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E195F874B0
 for <iommu@lists.linux-foundation.org>; Wed, 10 Feb 2021 16:13:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9ftzgJc7Rxbu for <iommu@lists.linux-foundation.org>;
 Wed, 10 Feb 2021 16:13:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E12038744C
 for <iommu@lists.linux-foundation.org>; Wed, 10 Feb 2021 16:13:27 +0000 (UTC)
IronPort-SDR: anNqd6sHwCJ51VoWu+hN3Ggj15SmMZFQkFC/8QP2FZEhsIjAJSmwHlp3HowNBBQQggw2fLR8JM
 0KPOO+riS3vg==
X-IronPort-AV: E=McAfee;i="6000,8403,9891"; a="178592261"
X-IronPort-AV: E=Sophos;i="5.81,168,1610438400"; d="scan'208";a="178592261"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2021 08:13:26 -0800
IronPort-SDR: /xiRUGXUeGLG1htggB11SM/yhLjN57OHzbzANld9rmCFnmfriA8pYZshYsZdZlrHoHdgGJmXyF
 OSJned8nDOdQ==
X-IronPort-AV: E=Sophos;i="5.81,168,1610438400"; d="scan'208";a="380191372"
Received: from mjyalung-mobl.amr.corp.intel.com (HELO
 jderrick-mobl.amr.corp.intel.com) ([10.209.178.245])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2021 08:13:25 -0800
From: Jon Derrick <jonathan.derrick@intel.com>
To: <linux-pci@vger.kernel.org>,
	<iommu@lists.linux-foundation.org>
Subject: [PATCH v4 0/2] VMD MSI Remapping Bypass
Date: Wed, 10 Feb 2021 09:13:13 -0700
Message-Id: <20210210161315.316097-1-jonathan.derrick@intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: Krzysztof Wilczynski <kw@linux.com>, Nirmal Patel <nirmal.patel@intel.com>,
 Kapil Karkra <kapil.karkra@intel.com>, Bjorn Helgaas <helgaas@kernel.org>,
 Jon Derrick <jonathan.derrick@intel.com>
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

The Intel Volume Management Device acts similar to a PCI-to-PCI bridge in that
it changes downstream devices' requester-ids to its own. As VMD supports PCIe
devices, it has its own MSI-X table and transmits child device MSI-X by
remapping child device MSI-X and handling like a demultiplexer.

Some newer VMD devices (Icelake Server) have an option to bypass the VMD MSI-X
remapping table. This allows for better performance scaling as the child device
MSI-X won't be limited by VMD's MSI-X count and IRQ handler.

V3->V4:
Integrated wording suggestions; no functional changes

V2->V3:
Trivial comment fixes
Added acks

V1->V2:
Updated for 5.12-next
Moved IRQ allocation and remapping enable/disable to a more logical location

V1 patches 1-4 were already merged
V1, 5/6: https://patchwork.kernel.org/project/linux-pci/patch/20200728194945.14126-6-jonathan.derrick@intel.com/
V1, 6/6: https://patchwork.kernel.org/project/linux-pci/patch/20200728194945.14126-7-jonathan.derrick@intel.com/


Jon Derrick (2):
  iommu/vt-d: Use Real PCI DMA device for IRTE
  PCI: vmd: Disable MSI-X remapping when possible

 drivers/iommu/intel/irq_remapping.c |  3 +-
 drivers/pci/controller/vmd.c        | 63 +++++++++++++++++++++++------
 2 files changed, 53 insertions(+), 13 deletions(-)

-- 
2.27.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
