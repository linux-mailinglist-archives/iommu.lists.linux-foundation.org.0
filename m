Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C140140710
	for <lists.iommu@lfdr.de>; Fri, 17 Jan 2020 10:58:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4C2BA86709;
	Fri, 17 Jan 2020 09:58:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V779U2tTiW8I; Fri, 17 Jan 2020 09:58:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A80248679E;
	Fri, 17 Jan 2020 09:58:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 92447C077D;
	Fri, 17 Jan 2020 09:58:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8FBF9C077D
 for <iommu@lists.linux-foundation.org>; Fri, 17 Jan 2020 09:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7DE5620335
 for <iommu@lists.linux-foundation.org>; Fri, 17 Jan 2020 09:58:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g3veIZe2CJs7 for <iommu@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 09:58:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 23C0120353
 for <iommu@lists.linux-foundation.org>; Fri, 17 Jan 2020 09:58:10 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 2D3B8327; Fri, 17 Jan 2020 10:58:07 +0100 (CET)
Date: Fri, 17 Jan 2020 10:58:05 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PULL REQUEST] iommu/vt-d: patches for v5.6 - 2nd wave
Message-ID: <20200117095805.GA15760@8bytes.org>
References: <20200115030359.13471-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200115030359.13471-1-baolu.lu@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org
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

On Wed, Jan 15, 2020 at 11:03:54AM +0800, Lu Baolu wrote:
> Barret Rhoden (2):
>   iommu/vt-d: Mark firmware tainted if RMRR fails sanity check
>   iommu/vt-d: Add RMRR base and end addresses sanity check
> 
> Lu Baolu (2):
>   iommu/vt-d: Allow devices with RMRRs to use identity domain
>   iommu/vt-d: Unnecessary to handle default identity domain
> 
> jimyan (1):
>   iommu/vt-d: Don't reject Host Bridge due to scope mismatch
> 
>  drivers/iommu/dmar.c        |  2 +-
>  drivers/iommu/intel-iommu.c | 47 ++++++++++++++++++-------------------
>  2 files changed, 24 insertions(+), 25 deletions(-)

All queued to the x86/vt-d branch, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
