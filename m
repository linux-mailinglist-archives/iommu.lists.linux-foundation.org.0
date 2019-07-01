Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A98C91B0F5
	for <lists.iommu@lfdr.de>; Mon, 13 May 2019 09:13:15 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BDC05B79;
	Mon, 13 May 2019 07:13:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 861275AA
	for <iommu@lists.linux-foundation.org>;
	Mon, 13 May 2019 07:13:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4171527B
	for <iommu@lists.linux-foundation.org>;
	Mon, 13 May 2019 07:13:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6E61C7DD10;
	Mon, 13 May 2019 07:13:11 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-17.ams2.redhat.com [10.36.116.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 65EA968435;
	Mon, 13 May 2019 07:13:07 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, joro@8bytes.org,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	dwmw2@infradead.org, lorenzo.pieralisi@arm.com, robin.murphy@arm.com,
	will.deacon@arm.com, hanjun.guo@linaro.org, sudeep.holla@arm.com
Subject: [PATCH 0/4] RMRR related fixes
Date: Mon, 13 May 2019 09:12:58 +0200
Message-Id: <20190513071302.30718-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 13 May 2019 07:13:11 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: alex.williamson@redhat.com
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

Currently the Intel reserved region is attached to the
RMRR unit and when building the list of RMRR seen by a device
we link this unique reserved region without taking care of
potential multiple usage of this reserved region by several devices.

Also while reading the vtd spec it is unclear to me whether
the RMRR device scope referenced by an RMRR ACPI struct could
be a PCI-PCI bridge, in which case I think we also need to
check the device belongs to the PCI sub-hierarchy of the device
referenced in the scope. This would be true for device_has_rmrr()
and intel_iommu_get_resv_regions().

Eric Auger (4):
  iommu: Pass a GFP flag parameter to iommu_alloc_resv_region()
  iommu/vt-d: Duplicate iommu_resv_region objects per device list
  iommu/vt-d: Handle RMRR with PCI bridge device scopes
  iommu/vt-d: Handle PCI bridge RMRR device scopes in
    intel_iommu_get_resv_regions

 drivers/acpi/arm64/iort.c   |  3 +-
 drivers/iommu/amd_iommu.c   |  7 ++--
 drivers/iommu/arm-smmu-v3.c |  2 +-
 drivers/iommu/arm-smmu.c    |  2 +-
 drivers/iommu/intel-iommu.c | 68 +++++++++++++++++++++++--------------
 drivers/iommu/iommu.c       |  7 ++--
 include/linux/iommu.h       |  2 +-
 7 files changed, 55 insertions(+), 36 deletions(-)

-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
