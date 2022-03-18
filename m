Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8D34DDC77
	for <lists.iommu@lfdr.de>; Fri, 18 Mar 2022 16:10:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEB618411E;
	Fri, 18 Mar 2022 15:10:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id De05rtUyKflw; Fri, 18 Mar 2022 15:10:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D818484132;
	Fri, 18 Mar 2022 15:10:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A6B5BC0012;
	Fri, 18 Mar 2022 15:10:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1CCA8C0012
 for <iommu@lists.linux-foundation.org>; Fri, 18 Mar 2022 15:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F056840510
 for <iommu@lists.linux-foundation.org>; Fri, 18 Mar 2022 15:10:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DQWjjymnMwKQ for <iommu@lists.linux-foundation.org>;
 Fri, 18 Mar 2022 15:10:36 +0000 (UTC)
X-Greylist: delayed 00:19:12 by SQLgrey-1.8.0
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net
 [IPv6:2a01:37:3000::53df:4ef0:0])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BC7CE4049C
 for <iommu@lists.linux-foundation.org>; Fri, 18 Mar 2022 15:10:36 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.hostsharing.net",
 Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
 by bmailout2.hostsharing.net (Postfix) with ESMTPS id 2C573280472B6;
 Fri, 18 Mar 2022 16:10:35 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 1EFCF5F03C; Fri, 18 Mar 2022 16:10:35 +0100 (CET)
Date: Fri, 18 Mar 2022 16:10:35 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] thunderbolt: Make iommu_dma_protection more accurate
Message-ID: <20220318151035.GB11127@wunner.de>
References: <2d01fa50c2650c730b0244929097737918e302e7.1647533152.git.robin.murphy@arm.com>
 <BL1PR12MB515783C0F998169D49D92A55E2129@BL1PR12MB5157.namprd12.prod.outlook.com>
 <BL1PR12MB51573F55B3C2B3922BAAA7F1E2129@BL1PR12MB5157.namprd12.prod.outlook.com>
 <YjRvMk1kcbMwJvx+@lahna>
 <65207fdf-c4ab-5165-dbda-8ab55b51adb7@arm.com>
 <YjSCWaq7Ej/2iJPp@lahna>
 <78fc0426-c22a-ec62-f92b-0019bea5947e@arm.com>
 <20220318145121.GA11127@wunner.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220318145121.GA11127@wunner.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "michael.jamet@intel.com" <michael.jamet@intel.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "YehezkelShB@gmail.com" <YehezkelShB@gmail.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 "andreas.noever@gmail.com" <andreas.noever@gmail.com>,
 "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>
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

On Fri, Mar 18, 2022 at 03:51:21PM +0100, Lukas Wunner wrote:
> On Fri, Mar 18, 2022 at 02:08:16PM +0000, Robin Murphy wrote:
> > OK, so do we have any realistic options for identifying the correct PCI
> > devices, if USB4 PCIe adapters might be anywhere relative to their
> > associated NHI? Short of maintaining a list of known IDs, the only thought I
> > have left is that if we walk the whole PCI segment looking specifically for
> > hotplug-capable Gen1 ports, any system modern enough to have Thunderbolt is
> > *probably* not going to have any real PCIe Gen1 hotplug slots, so maybe
> > false negatives might be tolerable, but it still feels like a bit of a
> > sketchy heuristic.
> 
> The Thunderbolt Device ROM contains the PCI slot number, so you can
> correlate the Thunderbolt switch ports with PCIe downstream ports
> and know exactly where PCIe tunnels are terminated.
[...]
> I implemented that in 2018, so it won't apply cleanly to current
> mainline.  But I kept forward-porting it on my private branch and
> could push that to GitHub if anyone is interested.

FWIW, here's the most recent forward-port I've done:

https://github.com/l1k/linux/commits/thunderbolt_correlate_5.13
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
