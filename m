Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id AC35E30310C
	for <lists.iommu@lfdr.de>; Tue, 26 Jan 2021 02:13:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 47236870E9;
	Tue, 26 Jan 2021 01:13:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zgin95Ptp6Lo; Tue, 26 Jan 2021 01:13:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id AD0E48710C;
	Tue, 26 Jan 2021 01:13:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9EBF3C013A;
	Tue, 26 Jan 2021 01:13:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D4EEBC013A
 for <iommu@lists.linux-foundation.org>; Tue, 26 Jan 2021 01:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BA1CE8710C
 for <iommu@lists.linux-foundation.org>; Tue, 26 Jan 2021 01:13:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D8aZBxgJ0rF7 for <iommu@lists.linux-foundation.org>;
 Tue, 26 Jan 2021 01:13:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D249E870E9
 for <iommu@lists.linux-foundation.org>; Tue, 26 Jan 2021 01:13:06 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id c12so11218362qtv.5
 for <iommu@lists.linux-foundation.org>; Mon, 25 Jan 2021 17:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RCicovIuFlmz+ypg8L3PoOuWlGavLF3Xg9FrMyiBxf8=;
 b=FB2Tpuc1HrWHU67D7lihDbhcABDw5J5jULrlvaEJiPnINhch/RYMx7KL9QSB7Af8dY
 eH5T39U+ajK31mQxL1tWTDvzMpIG97rSMoZXoSjD8DhGhUGc35qANZRwTXlDuQluhV13
 Ql5lQPMXrM7LhYGrk7FkUEgp8wsEtvO5FzDN26ha0sAcxusN1/qGjE7U5vjZ158aS0+G
 MPy3uXN88BmRua0FNN6IoBJSSK7zVWM4st6ypV63RN9lQ9q9+xjmW9rJC9qnDzaXN7t8
 lBtssPvQLIz/CZJQMZIXYo/GnVdnm2+8Y4kXGKOPFxcqVA9HhwPemMQrEhpXii7XrXJ3
 ItJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RCicovIuFlmz+ypg8L3PoOuWlGavLF3Xg9FrMyiBxf8=;
 b=BxD76HdwPOna+GjiA4FV1QVvX6dei8OXSpOwSQVGVD/OTSCWAeZJdknkoAugaJmFaD
 LMzMOq0se1NdyIVhd/67oDQHYzT30KBcXVLydA4hwZESO/tvw25SfbCxaNjkLajfRpMy
 yX2NVWlyK7kgVbxTCsQl4s2YVX0zAfObgGLAU3t2+3+bYFLdma54E5FyF4jz1BSKRymt
 uLnZh1PLLB9eRG7iAGRqiCh9VU5BKlfQRh57R+ZHbtJelN0CwYH78LRIwoqNnnLf+DHt
 TwCBqyYKiB1KY56KKSy1fXRHBfS2Srqxo6Mc9XhBFx+vBewBLJdTzy84ULevMs0o7g5B
 YmGw==
X-Gm-Message-State: AOAM531V3Lh86xz2r8fxK3re1sJL/mjfnPnkYNSV1gzb8XGyDyIQlrfu
 ld5eDYv0V8vt2buGH4Ph+fSlKQ==
X-Google-Smtp-Source: ABdhPJxpdPeFFvMV3gAxS1etvOF2FWSYe21i1REZljAHSmM3iwf+cRwhsoyKqoNP4Os8WkMpKLF4aA==
X-Received: by 2002:ac8:698a:: with SMTP id o10mr3184010qtq.242.1611623585887; 
 Mon, 25 Jan 2021 17:13:05 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.115.133])
 by smtp.gmail.com with ESMTPSA id 16sm12266715qtp.38.2021.01.25.17.13.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 17:13:05 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1l4Cum-006tPi-OX; Mon, 25 Jan 2021 21:13:04 -0400
Date: Mon, 25 Jan 2021 21:13:04 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
Subject: Re: [RFC PATCH v2] uacce: Add uacce_ctrl misc device
Message-ID: <20210126011304.GZ4605@ziepe.ca>
References: <1611563696-235269-1-git-send-email-wangzhou1@hisilicon.com>
 <20210125154717.GW4605@ziepe.ca>
 <96b655ade2534a65974a378bb68383ee@hisilicon.com>
 <20210125231619.GY4605@ziepe.ca>
 <5f64a68042c64f37b5cba74028bd2189@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5f64a68042c64f37b5cba74028bd2189@hisilicon.com>
Cc: "chensihang \(A\)" <chensihang1@hisilicon.com>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Zhangfei Gao <zhangfei.gao@linaro.org>,
 "Liguozhu \(Kenneth\)" <liguozhu@hisilicon.com>,
 "linux-accelerators@lists.ozlabs.org" <linux-accelerators@lists.ozlabs.org>
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

On Mon, Jan 25, 2021 at 11:35:22PM +0000, Song Bao Hua (Barry Song) wrote:

> > On Mon, Jan 25, 2021 at 10:21:14PM +0000, Song Bao Hua (Barry Song) wrote:
> > > mlock, while certainly be able to prevent swapping out, it won't
> > > be able to stop page moving due to:
> > > * memory compaction in alloc_pages()
> > > * making huge pages
> > > * numa balance
> > > * memory compaction in CMA
> > 
> > Enabling those things is a major reason to have SVA device in the
> > first place, providing a SW API to turn it all off seems like the
> > wrong direction.
> 
> I wouldn't say this is a major reason to have SVA. If we read the
> history of SVA and papers, people would think easy programming due
> to data struct sharing between cpu and device, and process space
> isolation in device would be the major reasons for SVA. SVA also
> declares it supports zero-copy while zero-copy doesn't necessarily
> depend on SVA.

Once you have to explicitly make system calls to declare memory under
IO, you loose all of that.

Since you've asked the app to be explicit about the DMAs it intends to
do, there is not really much reason to use SVA for those DMAs anymore.

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
