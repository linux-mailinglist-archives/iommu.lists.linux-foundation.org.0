Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EE234E0B6
	for <lists.iommu@lfdr.de>; Tue, 30 Mar 2021 07:36:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CBDA60802;
	Tue, 30 Mar 2021 05:36:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kvp0eJnpS2jj; Tue, 30 Mar 2021 05:36:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBC1860819;
	Tue, 30 Mar 2021 05:36:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9921FC000A;
	Tue, 30 Mar 2021 05:36:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E8457C000A
 for <iommu@lists.linux-foundation.org>; Tue, 30 Mar 2021 05:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC91E40431
 for <iommu@lists.linux-foundation.org>; Tue, 30 Mar 2021 05:36:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KYhVQ7KOmXMw for <iommu@lists.linux-foundation.org>;
 Tue, 30 Mar 2021 05:36:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D76840425
 for <iommu@lists.linux-foundation.org>; Tue, 30 Mar 2021 05:36:13 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 0F79168B05; Tue, 30 Mar 2021 07:36:07 +0200 (CEST)
Date: Tue, 30 Mar 2021 07:36:07 +0200
From: Christoph Hellwig <hch@lst.de>
To: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] ARM: Qualify enabling of swiotlb_init()
Message-ID: <20210330053607.GA4863@lst.de>
References: <20210319040333.183827-1-f.fainelli@gmail.com>
 <20210319130731.GB2624@lst.de>
 <20210319195929.GA1346384@konrad-char-us-oracle-com.allregionaliads.osdevelopmeniad.oraclevcn.com>
 <alpine.DEB.2.21.2103191718210.439@sstabellini-ThinkPad-T480s>
 <3db926f4-6047-cc62-8654-a965b8570e75@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3db926f4-6047-cc62-8654-a965b8570e75@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: xen-devel@lists.xensource.com,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 open list <linux-kernel@vger.kernel.org>, Russell King <linux@armlinux.org.uk>,
 Max Filippov <jcmvbkbc@gmail.com>,
 "open list:SWIOTLB SUBSYSTEM" <iommu@lists.linux-foundation.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 opendmb@gmail.com, Andrew Morton <akpm@linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org
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

On Mon, Mar 29, 2021 at 12:30:42PM -0700, Florian Fainelli wrote:
> Should I toss this in Russell's patch tracker or do you need me to make
> some changes to the patch?

Due to all the other changes in this area I don't think anything but
the swiotlb tree makes much sense here.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
