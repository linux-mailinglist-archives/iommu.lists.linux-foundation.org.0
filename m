Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D42AD17F560
	for <lists.iommu@lfdr.de>; Tue, 10 Mar 2020 11:51:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7C6E387C72;
	Tue, 10 Mar 2020 10:51:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5w+9eq-suk7x; Tue, 10 Mar 2020 10:51:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D74B487BEE;
	Tue, 10 Mar 2020 10:51:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C1965C0177;
	Tue, 10 Mar 2020 10:51:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7D6EDC0177
 for <iommu@lists.linux-foundation.org>; Tue, 10 Mar 2020 10:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 72A05883BF
 for <iommu@lists.linux-foundation.org>; Tue, 10 Mar 2020 10:51:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UkOM3-7jYYBy for <iommu@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 10:51:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C07A9882D6
 for <iommu@lists.linux-foundation.org>; Tue, 10 Mar 2020 10:51:16 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id CA8DF364; Tue, 10 Mar 2020 11:51:14 +0100 (CET)
Date: Tue, 10 Mar 2020 11:51:13 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [Patch V1 0/2] iommu/vtd: Fixes to the IOMMU debugfs
Message-ID: <20200310105113.GD3794@8bytes.org>
References: <1583784587-26126-1-git-send-email-megha.dey@linux.intel.com>
 <378262ba-3ab8-c458-e6ca-a656bbcd653f@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <378262ba-3ab8-c458-e6ca-a656bbcd653f@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: dwmw2@infradead.org, iommu@lists.linux-foundation.org,
 Megha Dey <megha.dey@linux.intel.com>, megha.dey@intel.com
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

On Tue, Mar 10, 2020 at 08:50:47AM +0800, Lu Baolu wrote:
> Thanks for the fixes. For two patches in this series:
> 
> Acked-by: Lu Baolu <baolu.lu@linux.intel.com>
> 
> Best regards,
> baolu
> 
> On 2020/3/10 4:09, Megha Dey wrote:
> > This patchset aims to fix some of the existing issues in the iommu debugfs.
> > 
> > The first patch aims to fix the debugfs register reads by using the correct
> > read function variant while reading the contents of iommu registers while
> > the second patch ensures the debugfs directory is populated even if DMA
> > remapping is disabled.
> > 
> > Megha Dey (2):
> >    iommu/vt-d: Fix debugfs register reads
> >    iommu/vt-d: Populate debugfs if IOMMUs are detected

Applied both, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
