Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B52E4198E
	for <lists.iommu@lfdr.de>; Wed, 12 Jun 2019 02:38:24 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A5B9A1484;
	Wed, 12 Jun 2019 00:38:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CF54E1225
	for <iommu@lists.linux-foundation.org>;
	Wed, 12 Jun 2019 00:36:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 81399775
	for <iommu@lists.linux-foundation.org>;
	Wed, 12 Jun 2019 00:36:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jun 2019 17:36:06 -0700
X-ExtLoop1: 1
Received: from allen-box.sh.intel.com ([10.239.159.136])
	by orsmga001.jf.intel.com with ESMTP; 11 Jun 2019 17:36:04 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>,
	David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v2 0/7] iommu/vt-d: Fixes and cleanups for linux-next
Date: Wed, 12 Jun 2019 08:28:44 +0800
Message-Id: <20190612002851.17103-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kevin.tian@intel.com, ashok.raj@intel.com, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, cai@lca.pw, jacob.jun.pan@intel.com
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

Hi Joerg,

This series includes several fixes and cleanups after delegating
DMA domain to generic iommu. Please review and consider them for
linux-next.

Best regards,
Baolu

Change log:
  v1->v2:
  - Refine "iommu/vt-d: Cleanup after delegating DMA domain to
    generic iommu" by removing an unnecessary cleanup.
  - Add "Allow DMA domain attaching to rmrr locked device" which
    fix a driver load issue.

Lu Baolu (6):
  iommu/vt-d: Don't return error when device gets right domain
  iommu/vt-d: Set domain type for a private domain
  iommu/vt-d: Don't enable iommu's which have been ignored
  iommu/vt-d: Allow DMA domain attaching to rmrr locked device
  iommu/vt-d: Fix suspicious RCU usage in probe_acpi_namespace_devices()
  iommu/vt-d: Consolidate domain_init() to avoid duplication

Sai Praneeth Prakhya (1):
  iommu/vt-d: Cleanup after delegating DMA domain to generic iommu

 drivers/iommu/intel-iommu.c | 200 +++++++++---------------------------
 1 file changed, 49 insertions(+), 151 deletions(-)

-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
