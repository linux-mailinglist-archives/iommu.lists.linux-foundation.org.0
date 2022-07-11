Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FC456864D
	for <lists.iommu@lfdr.de>; Wed,  6 Jul 2022 12:59:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1CDF402FE;
	Wed,  6 Jul 2022 10:59:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1CDF402FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ifWKgOk8PfPx; Wed,  6 Jul 2022 10:59:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 922B8402C2;
	Wed,  6 Jul 2022 10:59:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 922B8402C2
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 686FFC002D;
	Wed,  6 Jul 2022 10:59:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E1F7CC002D
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jul 2022 10:59:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF2CA402DC
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jul 2022 10:59:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF2CA402DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IsC6cKbByGXZ for <iommu@lists.linux-foundation.org>;
 Wed,  6 Jul 2022 10:59:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D82A6402C2
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D82A6402C2
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jul 2022 10:59:44 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 0DCF44CC; Wed,  6 Jul 2022 12:59:42 +0200 (CEST)
Date: Wed, 6 Jul 2022 12:59:41 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 0/1] iommu/vt-d: Fixes for v5.19-rc4
Message-ID: <YsVrHVlLkMzj7c/s@8bytes.org>
References: <20220625133430.2200315-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220625133430.2200315-1-baolu.lu@linux.intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>, iommu@lists.linux.dev,
 Chenyi Qiang <chenyi.qiang@intel.com>, iommu@lists.linux-foundation.org,
 Ethan Zhao <haifeng.zhao@linux.intel.com>
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

On Sat, Jun 25, 2022 at 09:34:29PM +0800, Lu Baolu wrote:
> Hi Joerg,
> 
> One fix is queued for v5.19. It aims to fix:
> 
> - RID2PASID setup/teardown failures for pci alias devices
> 
> Please consider it for the iommu/fix branch.
> 
> Best regards,
> Lu Baolu
> 
> Lu Baolu (1):
>   iommu/vt-d: Fix RID2PASID setup/teardown failure

Queued, thanks Baolu and sorry for the delay.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
