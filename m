Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 522A81A21F0
	for <lists.iommu@lfdr.de>; Wed,  8 Apr 2020 14:25:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id F32CA875FE;
	Wed,  8 Apr 2020 12:25:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id riiB-DHjfYEI; Wed,  8 Apr 2020 12:25:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8AE1286DAF;
	Wed,  8 Apr 2020 12:25:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 74011C0177;
	Wed,  8 Apr 2020 12:25:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6B8D2C0177
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 12:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5676920521
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 12:25:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 66y5fiNX-KDc for <iommu@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 12:25:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by silver.osuosl.org (Postfix) with ESMTPS id C321B2048D
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 12:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=7Zn3+mRH+PPxg4lfhT29xWKaDYKNW3X7ClOJo4l/mhI=; b=hR+APYPn4qf6/AfXml5kyb0qcP
 V8wEdWOLbEZNmFaTiQ2UeSmHXcuij5eNxrY9thz2k4jvGG1jN0iA25HRNzWfBhU2oBvyerv4zQ/sN
 FOQW6ZyVJcXPI7YZo0n52lmciZe+6TIbYlobXKiyRAbPh1OtukE4wXj1l8s8xo5ESVBJabBbvK4TZ
 OJsQVfctMQ+6rLnYDXm5xFzxrUu+GEC92g9J7raz3AbyePtFxfHqt4/dvPu8TIhiRIvcrn9Mhis9G
 GuL+c0JOXyi9ryNMynez0bJMTjgJloauImGZwQf1d3PZ587V2aWWKogtmLIYkYUpr/ITsFCj8oxCu
 o1KSHQ+Q==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jM9lQ-0001k8-35; Wed, 08 Apr 2020 12:25:04 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 833F5300478;
 Wed,  8 Apr 2020 14:25:01 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 702412BA90A66; Wed,  8 Apr 2020 14:25:01 +0200 (CEST)
Date: Wed, 8 Apr 2020 14:25:01 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: decruft the vmalloc API
Message-ID: <20200408122501.GA20713@hirez.programming.kicks-ass.net>
References: <20200408115926.1467567-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408115926.1467567-1-hch@lst.de>
Cc: linux-hyperv@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 "K. Y. Srinivasan" <kys@microsoft.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 x86@kernel.org, Laura Abbott <labbott@redhat.com>,
 Nitin Gupta <ngupta@vflare.org>, Daniel Vetter <daniel@ffwll.ch>,
 Haiyang Zhang <haiyangz@microsoft.com>, linaro-mm-sig@lists.linaro.org,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
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

On Wed, Apr 08, 2020 at 01:58:58PM +0200, Christoph Hellwig wrote:
> Hi all,
> 
> Peter noticed that with some dumb luck you can toast the kernel address
> space with exported vmalloc symbols.
> 
> I used this as an opportunity to decruft the vmalloc.c API and make it
> much more systematic.  This also removes any chance to create vmalloc
> mappings outside the designated areas or using executable permissions
> from modules.  Besides that it removes more than 300 lines of code.
> 

Looks great, thanks for doing this!

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
