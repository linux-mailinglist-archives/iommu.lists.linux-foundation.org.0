Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE1C566FDD
	for <lists.iommu@lfdr.de>; Tue,  5 Jul 2022 15:51:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9236E6105B;
	Tue,  5 Jul 2022 13:51:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9236E6105B
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=cDfN+bQc
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f-wYzhfqTVVe; Tue,  5 Jul 2022 13:51:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 8FE5E6102C;
	Tue,  5 Jul 2022 13:51:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FE5E6102C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3E989C007C;
	Tue,  5 Jul 2022 13:51:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ADC1CC002D
 for <iommu@lists.linux-foundation.org>; Tue,  5 Jul 2022 13:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8654041676
 for <iommu@lists.linux-foundation.org>; Tue,  5 Jul 2022 13:51:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8654041676
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca
 header.a=rsa-sha256 header.s=google header.b=cDfN+bQc
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OQqX6Q0lZPwY for <iommu@lists.linux-foundation.org>;
 Tue,  5 Jul 2022 13:51:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4C38408E4
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E4C38408E4
 for <iommu@lists.linux-foundation.org>; Tue,  5 Jul 2022 13:51:04 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id ck6so13680830qtb.7
 for <iommu@lists.linux-foundation.org>; Tue, 05 Jul 2022 06:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=aXXqCO4eYEW7ihl1nkLRPlC9zfL+9NshKktoq8vfUqo=;
 b=cDfN+bQczbdMb2leah0e/N44YCVFwIYBhS6uK2yvKAxV/VrnPHyc+hyWjNAaUg1PfL
 kVcyYs7o5yY5RdPBbZ1Uy12G+gaOeGz7GPvyLzJpp7K+3AfzkxCHdfURo3kwOoQVGHsB
 CgYT4nV/UQd7IrmpI3kE+7IkazWCK3VkAF/AOUDIg9vA84UJqgb+kOFEqstZkexFUiOW
 t4uMNrJQXIZB/yeHytTtD8UoGO1NLRJoiAFfgFOvXzUbr67CkUchXLiOTkdsKPw7QrA5
 0GMzIsPAHjhYnDnVJ1sJYE4BoAvaoerhS04hqo2hF28Qc0NfnJdWsyByjW3v2jzln7ab
 r2qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aXXqCO4eYEW7ihl1nkLRPlC9zfL+9NshKktoq8vfUqo=;
 b=O3Om7JbyayDFO+jR3ndBiwfP0QVKyXIMTZxckbAygiM+17EdeLHHoyguWLxRCYWIXE
 FIVf0WsiB4FTe8Hv2bRx1d+Pc4RWjoO0MqVo3b18ixCTSsrNKXIxGrOQM6Q7IvlJeXkv
 Z6DOmM8OkUdWiW6uUgHL27ISpPAhv9uyLRjqGNUOelQLgdrv1K3vP9bGsH1G95OZ9W9l
 kz4O+RBOzeK7xDU/eA3iFVQakdB/JEmIqrqLnnA0SijnyOdrp6aOSYUI0cU4ZAcBjSV9
 W4ZdaHBZ8sDqttj+UTZdtu/jozQdhQfZLGB0GeOrTrEN4CFN6shczP4EBWo+H4lIyKj3
 p3SQ==
X-Gm-Message-State: AJIora9ylyRt9+f/up/22SGRDV8Kn+bRkWy9khEDj2FZw3g69cEmO0gW
 +cM/RKphBXrTqHrfAiflBfsKkw==
X-Google-Smtp-Source: AGRyM1tiQ1fXhmwo7QGB7JVrZMkNllap136sZt6NhU7vlDBe2k8co+srzJapO8MDIuFHQGrnlFDnUA==
X-Received: by 2002:a05:6214:5005:b0:472:e6b0:1fb2 with SMTP id
 jo5-20020a056214500500b00472e6b01fb2mr12627413qvb.124.1657029063626; 
 Tue, 05 Jul 2022 06:51:03 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129]) by smtp.gmail.com with ESMTPSA id
 f10-20020a05620a280a00b006a69d7f390csm27745242qkp.103.2022.07.05.06.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 06:51:02 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1o8ixC-006VQ4-6E; Tue, 05 Jul 2022 10:51:02 -0300
Date: Tue, 5 Jul 2022 10:51:02 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v7 20/21] PCI/P2PDMA: Introduce pci_mmap_p2pmem()
Message-ID: <20220705135102.GE23621@ziepe.ca>
References: <20220615161233.17527-1-logang@deltatee.com>
 <20220615161233.17527-21-logang@deltatee.com>
 <20220629064854.GD17576@lst.de>
 <99242789-66a6-bbd2-b56a-e47891f4522e@deltatee.com>
 <20220629175906.GU23621@ziepe.ca> <20220705075108.GB17451@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220705075108.GB17451@lst.de>
Cc: linux-pci@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 linux-nvme@lists.infradead.org, Stephen Bates <sbates@raithlin.com>,
 linux-mm@kvack.org, Jason Ekstrand <jason@jlekstrand.net>,
 Ira Weiny <ira.weiny@intel.com>, Minturn Dave B <dave.b.minturn@intel.com>,
 Martin Oliveira <martin.oliveira@eideticom.com>,
 Matthew Wilcox <willy@infradead.org>,
 Chaitanya Kulkarni <ckulkarnilinux@gmail.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Ralph Campbell <rcampbell@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 linux-block@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Xiong Jianxin <jianxin.xiong@intel.com>, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Logan Gunthorpe <logang@deltatee.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
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

On Tue, Jul 05, 2022 at 09:51:08AM +0200, Christoph Hellwig wrote:

> But what also really matters here:  I don't want every user that
> wants to be able to mmap a character device to do all this work.
> The layering is simply wrong, it needs some character device
> based helpers, not be open code everywhere.

I think alot (all?) cases would be happy if the inode was 1:1 with the
cdev struct device. I suppose the cdev code would still have to create
pseudo fs, but at least that is hidden.

> In fact I'm not even sure this should be a character device, it seems
> to fit it way better with the PCI sysfs hierchacy, just like how we
> map MMIO resources, which these are anyway.  And once it is on sysfs
> we do have a uniqueue inode and need none of the pseudofs stuff, and
> don't need all the glue code in nvme either.

Shouldn't there be an allocator here? It feels a bit weird that the
entire CMB is given to a single process, it is a sharable resource,
isn't it?

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
