Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1497D229804
	for <lists.iommu@lfdr.de>; Wed, 22 Jul 2020 14:15:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C159788077;
	Wed, 22 Jul 2020 12:15:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Amavis-Alert: BAD HEADER SECTION, Header field occurs more than once: "To"
	occurs 3 times
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V2yQufJs2x7F; Wed, 22 Jul 2020 12:15:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 35FF288072;
	Wed, 22 Jul 2020 12:15:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1A88DC004C;
	Wed, 22 Jul 2020 12:15:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 680A8C004C
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 12:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5F20288660
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 12:15:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Amavis-Alert: BAD HEADER SECTION, Header field occurs more than once: "To"
 occurs 3 times
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CwHO-04mBvWm for <iommu@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 12:15:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DCEF188661
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 12:15:08 +0000 (UTC)
Received: from localhost (unknown [137.135.114.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6BF4520787;
 Wed, 22 Jul 2020 12:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595420108;
 bh=s9F70o+YVHAylQobk1Z1T7okng//DF/Q8/fYk4nXsVY=;
 h=Date:From:To:To:To:Cc:Cc:Cc:Cc:Subject:In-Reply-To:References:
 From;
 b=OvLlFsjXfF4zCTQuA/rg6KQ4f15pMkWZryxs64I6lHqYruftm6cSeJ9VLsWRK+sAL
 8Gtw50PaFz36SOj3SJBciBvpXXCZuXWEViw1Ydk03V/e144PWrYFUQs6oZ/erScTAv
 kgLWLHmsfrwI2c5u2r90sNx/4QxsZiT7QQhfyGrs=
Date: Wed, 22 Jul 2020 12:15:07 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 1/1] iommu/vt-d: Skip TE disabling on quirky gfx dedicated
 iommu
In-Reply-To: <20200721001713.24282-1-baolu.lu@linux.intel.com>
References: <20200721001713.24282-1-baolu.lu@linux.intel.com>
Message-Id: <20200722121508.6BF4520787@mail.kernel.org>
Cc: Koba Ko <koba.ko@canonical.com>, iommu@lists.linux-foundation.org,
 Ashok Raj <ashok.raj@intel.com>, stable@vger.kernel.org
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

Hi

[This is an automated email]

This commit has been processed because it contains a "Fixes:" tag
fixing commit: .

The bot has tested the following trees: v5.7.9, v5.4.52, v4.19.133, v4.14.188, v4.9.230, v4.4.230.

v5.7.9: Failed to apply! Possible dependencies:
    Unable to calculate

v5.4.52: Failed to apply! Possible dependencies:
    Unable to calculate

v4.19.133: Failed to apply! Possible dependencies:
    e5e04d051979d ("iommu/vt-d: Check whether device requires bounce buffer")

v4.14.188: Failed to apply! Possible dependencies:
    85319dcc8955f ("iommu/vt-d: Add for_each_device_domain() helper")
    9ddbfb42138d8 ("iommu/vt-d: Move device_domain_info to header")
    e5e04d051979d ("iommu/vt-d: Check whether device requires bounce buffer")

v4.9.230: Failed to apply! Possible dependencies:
    161b28aae1651 ("iommu/vt-d: Make sure IOMMUs are off when intel_iommu=off")
    61012985eb132 ("iommu/vt-d: Use lo_hi_readq() / lo_hi_writeq()")
    85319dcc8955f ("iommu/vt-d: Add for_each_device_domain() helper")
    9ddbfb42138d8 ("iommu/vt-d: Move device_domain_info to header")
    a7fdb6e648fb1 ("iommu/vt-d: Fix crash when accessing VT-d sysfs entries")
    b0119e870837d ("iommu: Introduce new 'struct iommu_device'")
    b316d02a13c3a ("iommu/vt-d: Unwrap __get_valid_domain_for_dev()")
    bfd20f1cc8501 ("x86, iommu/vt-d: Add an option to disable Intel IOMMU force on")
    e5e04d051979d ("iommu/vt-d: Check whether device requires bounce buffer")

v4.4.230: Failed to apply! Possible dependencies:
    0824c5920b16f ("iommu/vt-d: avoid dev iotlb logic for domains with no dev iotlbs")
    161b28aae1651 ("iommu/vt-d: Make sure IOMMUs are off when intel_iommu=off")
    314f1dc140844 ("iommu/vt-d: refactoring of deferred flush entries")
    53c92d793395f ("iommu: of: enforce const-ness of struct iommu_ops")
    57f98d2f61e19 ("iommu: Introduce iommu_fwspec")
    592033790e827 ("iommu/vt-d: Check the return value of iommu_device_create()")
    85319dcc8955f ("iommu/vt-d: Add for_each_device_domain() helper")
    8d54d6c8b8f3e ("iommu/amd: Implement apply_dm_region call-back")
    9ddbfb42138d8 ("iommu/vt-d: Move device_domain_info to header")
    a7fdb6e648fb1 ("iommu/vt-d: Fix crash when accessing VT-d sysfs entries")
    aa4732406e129 ("iommu/vt-d: per-cpu deferred invalidation queues")
    b0119e870837d ("iommu: Introduce new 'struct iommu_device'")
    b996444cf35e7 ("iommu/of: Handle iommu-map property for PCI")
    bc8474549e94e ("iommu/vt-d: Fix up error handling in alloc_iommu")
    bfd20f1cc8501 ("x86, iommu/vt-d: Add an option to disable Intel IOMMU force on")
    e5e04d051979d ("iommu/vt-d: Check whether device requires bounce buffer")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks
Sasha
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
