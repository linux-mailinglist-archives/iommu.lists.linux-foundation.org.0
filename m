Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 726523836C0
	for <lists.iommu@lfdr.de>; Mon, 17 May 2021 17:35:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AD1260A4D;
	Mon, 17 May 2021 15:35:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iemAjX5fDBpG; Mon, 17 May 2021 15:35:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FC9860899;
	Mon, 17 May 2021 15:35:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 64F13C001C;
	Mon, 17 May 2021 15:35:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E01AFC0001
 for <iommu@lists.linux-foundation.org>; Mon, 17 May 2021 15:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD27E402F7
 for <iommu@lists.linux-foundation.org>; Mon, 17 May 2021 15:35:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gaMVUS6h55YE for <iommu@lists.linux-foundation.org>;
 Mon, 17 May 2021 15:35:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 17430402AB
 for <iommu@lists.linux-foundation.org>; Mon, 17 May 2021 15:35:15 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 1A3C23A4; Mon, 17 May 2021 17:35:12 +0200 (CEST)
Date: Mon, 17 May 2021 17:35:10 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 3/6] vfio: remove the unused mdev iommu hook
Message-ID: <YKKNLrdQ4QjhLrKX@8bytes.org>
References: <MWHPR11MB1886E02BF7DE371E9665AA328C519@MWHPR11MB1886.namprd11.prod.outlook.com>
 <20210513120058.GG1096940@ziepe.ca>
 <MWHPR11MB1886B92507ED9015831A0CEA8C509@MWHPR11MB1886.namprd11.prod.outlook.com>
 <20210514121925.GI1096940@ziepe.ca>
 <MWHPR11MB18866205125E566FE05867A78C509@MWHPR11MB1886.namprd11.prod.outlook.com>
 <20210514133143.GK1096940@ziepe.ca> <YKJf7mphTHZoi7Qr@8bytes.org>
 <20210517123010.GO1096940@ziepe.ca> <YKJnPGonR+d8rbu/@8bytes.org>
 <20210517133500.GP1096940@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210517133500.GP1096940@ziepe.ca>
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Will Deacon <will@kernel.org>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>, Christoph Hellwig <hch@lst.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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

On Mon, May 17, 2021 at 10:35:00AM -0300, Jason Gunthorpe wrote:
> Well, I'm sorry, but there is a huge other thread talking about the
> IOASID design in great detail and why this is all needed. Jumping into
> this thread without context and basically rejecting all the
> conclusions that were reached over the last several weeks is really
> not helpful - especially since your objection is not technical.
> 
> I think you should wait for Intel to put together the /dev/ioasid uAPI
> proposal and the example use cases it should address then you can give
> feedback there, with proper context.

Yes, I think the next step is that someone who read the whole thread
writes up the conclusions and a rough /dev/ioasid API proposal, also
mentioning the use-cases it addresses. Based on that we can discuss the
implications this needs to have for IOMMU-API and code.

From the use-cases I know the mdev concept is just fine. But if there is
a more generic one we can talk about it.

Regards,

	Joerg

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
