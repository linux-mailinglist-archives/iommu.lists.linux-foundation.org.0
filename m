Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 69143DA76
	for <lists.iommu@lfdr.de>; Mon, 29 Apr 2019 04:18:43 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 653BB1DDB;
	Mon, 29 Apr 2019 02:18:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2FF0A1D35
	for <iommu@lists.linux-foundation.org>;
	Mon, 29 Apr 2019 02:16:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B1BC6608
	for <iommu@lists.linux-foundation.org>;
	Mon, 29 Apr 2019 02:15:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Apr 2019 19:15:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,408,1549958400"; d="scan'208";a="146537831"
Received: from allen-box.sh.intel.com ([10.239.159.136])
	by orsmga003.jf.intel.com with ESMTP; 28 Apr 2019 19:15:55 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: David Woodhouse <dwmw2@infradead.org>,
	Joerg Roedel <joro@8bytes.org>
Subject: [PATCH v3 0/8] iommu/vt-d: Delegate DMA domain to generic iommu
Date: Mon, 29 Apr 2019 10:09:17 +0800
Message-Id: <20190429020925.18136-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kevin.tian@intel.com, ashok.raj@intel.com, dima@arista.com,
	tmurphy@arista.com, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, jacob.jun.pan@intel.com
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

Hi,

This patchset delegates the iommu DMA domain management to the
generic iommu layer. It avoids the use of find_or_alloc_domain
whose domain assignment is inconsistent with the iommu grouping
as determined by pci_device_group.

The major change is to permit domains of type IOMMU_DOMAIN_DMA
and IOMMU_DOMAIN_IDENTITY to be allocated via the iommu_ops api.
This allows the default_domain of an iommu group to be set in
iommu.c. This domain will be attached to every device that is
brought up with an iommu group, and the devices reserved regions
will be mapped using regions returned by get_resv_regions.

The default domain implementation defines a default domain type
and a domain of the default domain type will be allocated and
attached to devices which belong to a same group. Unfortunately,
this doesn't work for some quirky devices which is known to only
work with a specific domain type. PATCH 1/8 adds an iommu ops
which allows the IOMMU driver to return whether a device requires
a specific domain type, otherwise the staic defined type will be
applied.

Other changes are limited within the Intel IOMMU driver. They
mainly allow the driver to adapt to allocating domains, attaching
domains, applying and direct mapping reserved memory regions,
deferred domain attachment, and so on, via the iommu_ops api's.

This patchset was initiated by James Sewart. The v1 and v2 were
posted here [1] [2] for discussion. Lu Baolu took over the work
for testing and bug fixing with permission from James Sewart.

Reference:
[1] https://lkml.org/lkml/2019/3/4/644
[2] https://lkml.org/lkml/2019/3/14/299

Best regards,
Lu Baolu

Change log:
 v2->v3:
  - Add supported default domain type callback.
  - Make the iommu map() callback work even the domain is not
    attached.
  - Add domain deferred attach when iommu is pre-enabled in
    kdump kernel. 

 v1->v2:
  - https://lkml.org/lkml/2019/3/14/299
  - Refactored ISA direct mappings to be returned by
    iommu_get_resv_regions.
  - Integrated patch by Lu to defer turning on DMAR until iommu.c
    has mapped reserved regions.
  - Integrated patches by Lu to remove more unused code in cleanup.

 v1:
  -Original post https://lkml.org/lkml/2019/3/4/644

James Sewart (4):
  iommu/vt-d: Implement apply_resv_region iommu ops entry
  iommu/vt-d: Expose ISA direct mapping region via
    iommu_get_resv_regions
  iommu/vt-d: Allow DMA domains to be allocated by iommu ops
  iommu/vt-d: Remove lazy allocation of domains

Lu Baolu (4):
  iommu: Add ops entry for supported default domain type
  iommu/vt-d: Enable DMA remapping after rmrr mapped
  iommu/vt-d: Implement def_domain_type iommu ops entry
  iommu/vt-d: Implement is_attach_deferred iommu ops entry

 drivers/iommu/intel-iommu.c | 630 +++++++++++-------------------------
 drivers/iommu/iommu.c       |  13 +-
 include/linux/iommu.h       |  11 +
 3 files changed, 210 insertions(+), 444 deletions(-)

-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
