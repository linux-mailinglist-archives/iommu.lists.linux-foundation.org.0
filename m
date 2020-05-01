Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0121C0D81
	for <lists.iommu@lfdr.de>; Fri,  1 May 2020 06:48:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B800C88718;
	Fri,  1 May 2020 04:48:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4MOeEa2tIqyF; Fri,  1 May 2020 04:48:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A478988BC3;
	Fri,  1 May 2020 04:48:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 923A1C016F;
	Fri,  1 May 2020 04:48:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3EAB3C016F
 for <iommu@lists.linux-foundation.org>; Fri,  1 May 2020 02:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2701988B52
 for <iommu@lists.linux-foundation.org>; Fri,  1 May 2020 02:38:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JL9CWGpoKCSl for <iommu@lists.linux-foundation.org>;
 Fri,  1 May 2020 02:38:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2B13588B10
 for <iommu@lists.linux-foundation.org>; Fri,  1 May 2020 02:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588300705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P8k2aTeCbIA0Pe5nqRNlnguJBbZob6iEKj+wNv40n6s=;
 b=OQjNORmsSLYYujNiIOWKWp3ybwru/UmntRHxje++DKPQ5vd6LZX5r+YQRZGeFs0D4yKYkO
 K4AfDlhZOGIeiASF7cErLGKhwFkOudTPowZhUkO4tFT7264qhKEXdT6RIPDXzwQWzWMCBu
 /Kss3WMvqsB47TmsomWDfB3lO+bf+ok=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-RQCyzGnAN4yPA1iVxKNE6g-1; Thu, 30 Apr 2020 22:38:22 -0400
X-MC-Unique: RQCyzGnAN4yPA1iVxKNE6g-1
Received: by mail-ua1-f69.google.com with SMTP id t26so3656653uar.14
 for <iommu@lists.linux-foundation.org>; Thu, 30 Apr 2020 19:38:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P8k2aTeCbIA0Pe5nqRNlnguJBbZob6iEKj+wNv40n6s=;
 b=K4cm2Mg6viIezc4WwUQmE327N6LBhDVkfVTY0GHuOkyBtO/xhmZo0DLIspirl+OgdS
 NMcuEkxKY+p/Y37NPKhxIw+OCzwdQUcUPoAZNRWoqGCbat2tmUgVVpsvSTf1W2m1g6tH
 t/AWlM60QxS9NAFJhtLV3oHDdL5lraZO+ZS6f2PzBwAr50hDqfsMm+ZmvZUgEgSJQXwI
 Io0WUk/X3KONc4F7jaz3/w3l0e3VMnoHFZjQmV7409lMcpYJqv96Tb5ljJFLXP+4qNQy
 Sh/YlXThkU23fOjJy53zLpmrWofiMtgc/riiz5hQtcuirvBIBInJrnhO4iezsLZSKIfT
 eCPA==
X-Gm-Message-State: AGi0Pub3EJhEymIkK3Ku2nXQc+B46IHm7sKOlqx5AlIafPC3uFl8/xCI
 hZi1sDRnh956duPjzLU911EpuoaVKvJ43jdfDjFE7FkmmG20bpfhrsUteBV205n756iabOx7Xi6
 9PE3eLDx2kFhkvsbdaxVsV+S1cEdRyNckTK0UNng8i24N2w==
X-Received: by 2002:a05:6102:4d:: with SMTP id
 k13mr1848897vsp.198.1588300701711; 
 Thu, 30 Apr 2020 19:38:21 -0700 (PDT)
X-Google-Smtp-Source: APiQypKu6ClZ61atP80MD4lQJkn2FtP3gZkiC+YuTXU2rwKV21SshkG1nW93zQxISm3Y7jRVOl6JpuyIYF8Yu55j3FA=
X-Received: by 2002:a05:6102:4d:: with SMTP id
 k13mr1848869vsp.198.1588300701546; 
 Thu, 30 Apr 2020 19:38:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200414131348.444715-1-hch@lst.de>
 <20200414131348.444715-22-hch@lst.de>
 <20200414151344.zgt2pnq7cjq2bgv6@debian>
 <CAMeeMh8Q3Od76WaTasw+BpYVF58P-HQMaiFKHxXbZ_Q3tQPZ=A@mail.gmail.com>
In-Reply-To: <CAMeeMh8Q3Od76WaTasw+BpYVF58P-HQMaiFKHxXbZ_Q3tQPZ=A@mail.gmail.com>
From: John Dorminy <jdorminy@redhat.com>
Date: Thu, 30 Apr 2020 22:38:10 -0400
Message-ID: <CAMeeMh_9N0ORhPM8EmkGeeuiDoQY3+QoAPX5QBuK7=gsC5ONng@mail.gmail.com>
Subject: Re: [PATCH 21/29] mm: remove the pgprot argument to __vmalloc
To: Wei Liu <wei.liu@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Mailman-Approved-At: Fri, 01 May 2020 04:48:01 +0000
Cc: linux-hyperv@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Michael Kelley <mikelley@microsoft.com>,
 linux-mm@kvack.org, "K. Y. Srinivasan" <kys@microsoft.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Stephen Hemminger <sthemmin@microsoft.com>,
 x86@kernel.org, Christoph Hellwig <hch@lst.de>,
 Peter Zijlstra <peterz@infradead.org>, Gao Xiang <xiang@kernel.org>,
 Laura Abbott <labbott@redhat.com>, Nitin Gupta <ngupta@vflare.org>,
 Daniel Vetter <daniel@ffwll.ch>, Haiyang Zhang <haiyangz@microsoft.com>,
 linaro-mm-sig@lists.linaro.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Robin Murphy <robin.murphy@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Minchan Kim <minchan@kernel.org>, iommu@lists.linux-foundation.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
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

>> On Tue, Apr 14, 2020 at 03:13:40PM +0200, Christoph Hellwig wrote:
>> > The pgprot argument to __vmalloc is always PROT_KERNEL now, so remove
>> > it.

Greetings;

I recently noticed this change via the linux-next tree.

It may not be possible to edit at this late date, but the change
description refers to PROT_KERNEL, which is a symbol which does not
appear to exist; perhaps PAGE_KERNEL was meant? The mismatch caused me
and a couple other folks some confusion briefly until we decided it
was supposed to be PAGE_KERNEL; if it's not too late, editing the
description to clarify so would be nice.

Many thanks.

John Dorminy

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
