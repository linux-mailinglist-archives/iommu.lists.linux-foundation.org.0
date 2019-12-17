Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F821227F7
	for <lists.iommu@lfdr.de>; Tue, 17 Dec 2019 10:53:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6635D87A00;
	Tue, 17 Dec 2019 09:53:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pDB85+Yxdx5D; Tue, 17 Dec 2019 09:53:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E4B47879CD;
	Tue, 17 Dec 2019 09:53:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CC86BC077D;
	Tue, 17 Dec 2019 09:53:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D029CC077D
 for <iommu@lists.linux-foundation.org>; Tue, 17 Dec 2019 09:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B9B8585BF2
 for <iommu@lists.linux-foundation.org>; Tue, 17 Dec 2019 09:53:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8-ItcBQOXyl9 for <iommu@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 09:53:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4EBF085BAE
 for <iommu@lists.linux-foundation.org>; Tue, 17 Dec 2019 09:53:45 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 2AAA1286; Tue, 17 Dec 2019 10:53:43 +0100 (CET)
Date: Tue, 17 Dec 2019 10:53:41 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH v2] iommu/amd: Disable IOMMU on Stoney Ridge systems
Message-ID: <20191217095341.GG8689@8bytes.org>
References: <20191129142154.29658-1-kai.heng.feng@canonical.com>
 <20191202170011.GC30032@infradead.org>
 <974A8EB3-70B6-4A33-B36C-CFF69464493C@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <974A8EB3-70B6-4A33-B36C-CFF69464493C@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Alex Deucher <alexander.deucher@amd.com>, iommu@lists.linux-foundation.org,
 Kernel development list <linux-kernel@vger.kernel.org>
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

On Fri, Dec 06, 2019 at 01:57:41PM +0800, Kai-Heng Feng wrote:
> Hi Joerg,
> 
> > On Dec 3, 2019, at 01:00, Christoph Hellwig <hch@infradead.org> wrote:
> > 
> > On Fri, Nov 29, 2019 at 10:21:54PM +0800, Kai-Heng Feng wrote:
> >> Serious screen flickering when Stoney Ridge outputs to a 4K monitor.
> >> 
> >> According to Alex Deucher, IOMMU isn't enabled on Windows, so let's do
> >> the same here to avoid screen flickering on 4K monitor.
> > 
> > Disabling the IOMMU entirely seem pretty severe.  Isn't it enough to
> > identity map the GPU device?
> 
> Ok, there's set_device_exclusion_range() to exclude the device from IOMMU.
> However I don't know how to generate range_start and range_length, which are read from ACPI.

set_device_exclusion_range() is not the solution here. The best is if
the GPU device is put into a passthrough domain at boot, in which it
will be identity mapped. DMA still goes through the IOMMU in this case,
but it only needs to lookup the device-table, page-table walks will not
be done anymore.

The best way to implement this is to put it into the
amd_iommu_add_device() in drivers/iommu/amd_iommu.c. There is this
check:

        if (dev_data->iommu_v2)
		iommu_request_dm_for_dev(dev);

The iommu_request_dm_for_dev() function causes the device to be identity
mapped. The check can be extended to also check for a device white-list
for devices that need identity mapping.

HTH,

	Joerg

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
