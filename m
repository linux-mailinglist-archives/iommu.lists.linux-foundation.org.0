Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4DD36DAD6
	for <lists.iommu@lfdr.de>; Wed, 28 Apr 2021 17:06:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D45F404DD;
	Wed, 28 Apr 2021 15:06:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W8L-fZ92fklr; Wed, 28 Apr 2021 15:06:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 55BBD400D6;
	Wed, 28 Apr 2021 15:06:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2845AC0001;
	Wed, 28 Apr 2021 15:06:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6F290C0001
 for <iommu@lists.linux-foundation.org>; Wed, 28 Apr 2021 15:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 567F7844A5
 for <iommu@lists.linux-foundation.org>; Wed, 28 Apr 2021 15:06:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2emWcwDEQ6AM for <iommu@lists.linux-foundation.org>;
 Wed, 28 Apr 2021 15:06:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2B35A8448E
 for <iommu@lists.linux-foundation.org>; Wed, 28 Apr 2021 15:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619622399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zftD9DhX6kilajc1JR4rVj986eWNpAry/j1BY289hak=;
 b=ZfUug6Ur4d5Gt30zUp0ybmKfidh3+yP5Vhpane8QX8b1DyJmNc3MrusAi6F3ncqTH4IXgy
 LRTWZa8QESQKUHniWLuNBwnVO7CkXd9TVmCOe5KhRSbW+jqV0jqBzgG+e8xKZFBVZmnGOM
 nj/eYFJ5YEZGU0hvPqPOZz6aeQKwHXU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-RkfH_XnQM12aZfppyhR3bA-1; Wed, 28 Apr 2021 11:06:35 -0400
X-MC-Unique: RkfH_XnQM12aZfppyhR3bA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5440B804030;
 Wed, 28 Apr 2021 15:06:31 +0000 (UTC)
Received: from redhat.com (ovpn-113-225.phx2.redhat.com [10.3.113.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E72AD687FF;
 Wed, 28 Apr 2021 15:06:25 +0000 (UTC)
Date: Wed, 28 Apr 2021 09:06:25 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH V4 05/18] iommu/ioasid: Redefine IOASID set and
 allocation APIs
Message-ID: <20210428090625.5a05dae8@redhat.com>
In-Reply-To: <MWHPR11MB188625137D5B7423822396C88C409@MWHPR11MB1886.namprd11.prod.outlook.com>
References: <20210421162307.GM1370958@nvidia.com>
 <20210421105451.56d3670a@redhat.com>
 <20210421175203.GN1370958@nvidia.com>
 <20210421133312.15307c44@redhat.com>
 <20210421230301.GP1370958@nvidia.com>
 <MWHPR11MB1886188698A6E20338196F788C469@MWHPR11MB1886.namprd11.prod.outlook.com>
 <20210422121020.GT1370958@nvidia.com>
 <MWHPR11MB1886E688D2128C98A1F240B18C459@MWHPR11MB1886.namprd11.prod.outlook.com>
 <20210423114944.GF1370958@nvidia.com>
 <MWHPR11MB18861FE6982D73AFBF173E048C439@MWHPR11MB1886.namprd11.prod.outlook.com>
 <20210426123817.GQ1370958@nvidia.com>
 <MWHPR11MB188625137D5B7423822396C88C409@MWHPR11MB1886.namprd11.prod.outlook.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Li Zefan <lizefan@huawei.com>, "Jiang, Dave" <dave.jiang@intel.com>, "Raj,
 Ashok" <ashok.raj@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 LKML <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Tejun Heo <tj@kernel.org>, "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
 "Wu, Hao" <hao.wu@intel.com>, David Woodhouse <dwmw2@infradead.org>
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

On Wed, 28 Apr 2021 06:34:11 +0000
"Tian, Kevin" <kevin.tian@intel.com> wrote:

> > From: Jason Gunthorpe <jgg@nvidia.com>
> > Sent: Monday, April 26, 2021 8:38 PM
> >   
> [...]
> > > Want to hear your opinion for one open here. There is no doubt that
> > > an ioasid represents a HW page table when the table is constructed by
> > > userspace and then linked to the IOMMU through the bind/unbind
> > > API. But I'm not very sure about whether an ioasid should represent
> > > the exact pgtable or the mapping metadata when the underlying
> > > pgtable is indirectly constructed through map/unmap API. VFIO does
> > > the latter way, which is why it allows multiple incompatible domains
> > > in a single container which all share the same mapping metadata.  
> > 
> > I think VFIO's map/unmap is way too complex and we know it has bad
> > performance problems.  
> 
> Can you or Alex elaborate where the complexity and performance problem
> locate in VFIO map/umap? We'd like to understand more detail and see how 
> to avoid it in the new interface.


The map/unmap interface is really only good for long lived mappings,
the overhead is too high for things like vIOMMU use cases or any case
where the mapping is intended to be dynamic.  Userspace drivers must
make use of a long lived buffer mapping in order to achieve performance.

The mapping and unmapping granularity has been a problem as well,
type1v1 allowed arbitrary unmaps to bisect the original mapping, with
the massive caveat that the caller relies on the return value of the
unmap to determine what was actually unmapped because the IOMMU use of
superpages is transparent to the caller.  This led to type1v2 that
simply restricts the user to avoid ever bisecting mappings.  That still
leaves us with problems for things like virtio-mem support where we
need to create initial mappings with a granularity that allows us to
later remove entries, which can prevent effective use of IOMMU
superpages.

Locked page accounting has been another constant issue.  We perform
locked page accounting at the container level, where each container
accounts independently.  A user may require multiple containers, the
containers may pin the same physical memory, but be accounted against
the user once per container.

Those are the main ones I can think of.  It is nice to have a simple
map/unmap interface, I'd hope that a new /dev/ioasid interface wouldn't
raise the barrier to entry too high, but the user needs to have the
ability to have more control of their mappings and locked page
accounting should probably be offloaded somewhere.  Thanks,

Alex

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
