Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 366A7363B91
	for <lists.iommu@lfdr.de>; Mon, 19 Apr 2021 08:36:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FB9D40237;
	Mon, 19 Apr 2021 06:36:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1VMjPlZM-J7M; Mon, 19 Apr 2021 06:36:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93B3140236;
	Mon, 19 Apr 2021 06:36:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 66744C001B;
	Mon, 19 Apr 2021 06:36:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 09F3DC000B
 for <iommu@lists.linux-foundation.org>; Mon, 19 Apr 2021 06:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ECB3040135
 for <iommu@lists.linux-foundation.org>; Mon, 19 Apr 2021 06:36:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JIU1D6A6QMgU for <iommu@lists.linux-foundation.org>;
 Mon, 19 Apr 2021 06:36:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D32E1400C0
 for <iommu@lists.linux-foundation.org>; Mon, 19 Apr 2021 06:36:36 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 030166736F; Mon, 19 Apr 2021 08:36:31 +0200 (CEST)
Date: Mon, 19 Apr 2021 08:36:30 +0200
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [Resend RFC PATCH V2 07/12] HV/Vmbus: Initialize VMbus ring
 buffer for Isolation VM
Message-ID: <20210419063630.GA18882@lst.de>
References: <20210414144945.3460554-1-ltykernel@gmail.com>
 <20210414144945.3460554-8-ltykernel@gmail.com>
 <YHig78Xra5tEQhMD@dhcp-10-154-102-149.vpn.oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YHig78Xra5tEQhMD@dhcp-10-154-102-149.vpn.oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: linux-hyperv@vger.kernel.org, brijesh.singh@amd.com, linux-mm@kvack.org,
 hpa@zytor.com, kys@microsoft.com, will@kernel.org, hch@lst.de,
 linux-arch@vger.kernel.org, wei.liu@kernel.org, sthemmin@microsoft.com,
 linux-scsi@vger.kernel.org, x86@kernel.org, Tianyu Lan <ltykernel@gmail.com>,
 mingo@redhat.com, kuba@kernel.org, jejb@linux.ibm.com, thomas.lendacky@amd.com,
 Tianyu Lan <Tianyu.Lan@microsoft.com>, arnd@arndb.de, haiyangz@microsoft.com,
 bp@alien8.de, tglx@linutronix.de, vkuznets@redhat.com,
 martin.petersen@oracle.com, gregkh@linuxfoundation.org, sunilmut@microsoft.com,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 netdev@vger.kernel.org, akpm@linux-foundation.org, robin.murphy@arm.com,
 davem@davemloft.net
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

On Thu, Apr 15, 2021 at 04:24:15PM -0400, Konrad Rzeszutek Wilk wrote:
> So you are exposing these two:
>  EXPORT_SYMBOL_GPL(get_vm_area);
>  EXPORT_SYMBOL_GPL(ioremap_page_range);
> 
> But if you used vmap wouldn't you get the same thing for free?

Yes, this needs to go into some vmap version, preferably reusing the
existing code in kernel/dma/remap.c.

Exporting get_vm_area is a complete dealbreaker and not going to happen.
We worked hard on not exposing it to modules.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
