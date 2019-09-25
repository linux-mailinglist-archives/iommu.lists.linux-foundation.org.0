Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A74BDED6
	for <lists.iommu@lfdr.de>; Wed, 25 Sep 2019 15:23:17 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id ECF8AAF0;
	Wed, 25 Sep 2019 13:23:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A1D72AF0
	for <iommu@lists.linux-foundation.org>;
	Wed, 25 Sep 2019 13:23:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 39A818C1
	for <iommu@lists.linux-foundation.org>;
	Wed, 25 Sep 2019 13:23:04 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 67365498; Wed, 25 Sep 2019 15:23:01 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: iommu@lists.linux-foundation.org,
	Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 0/6] iommu/amd: Locking Fixes
Date: Wed, 25 Sep 2019 15:22:54 +0200
Message-Id: <20190925132300.3038-1-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Filippo Sironi <sironi@amazon.de>, jroedel@suse.de
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

here are a couple of fixes for the amd iommu driver to fix a
few locking issues around protection-domains. Main problem
was that some traversals of ->dev_list were not locked in
any form, causing potential race conditions.

But there are more issues fixed here, for example the racy
access to protection_domain->updated and races in the
attach/detach_device code paths.

Changes are boot-tested with lockdep enabled, looked all
good so far.

Please review.

Thanks,

	Joerg

Joerg Roedel (6):
  iommu/amd: Remove domain->updated
  iommu/amd: Remove amd_iommu_devtable_lock
  iommu/amd: Take domain->lock for complete attach/detach path
  iommu/amd: Check for busy devices earlier in attach_device()
  iommu/amd: Lock dev_data in attach/detach code paths
  iommu/amd: Lock code paths traversing protection_domain->dev_list

 drivers/iommu/amd_iommu.c       | 166 ++++++++++++++++----------------
 drivers/iommu/amd_iommu_types.h |   4 +-
 2 files changed, 85 insertions(+), 85 deletions(-)

-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
