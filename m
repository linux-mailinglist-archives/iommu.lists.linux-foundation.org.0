Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEE21C3FD7
	for <lists.iommu@lfdr.de>; Mon,  4 May 2020 18:29:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id AB88088AD8;
	Mon,  4 May 2020 16:29:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q1Lx+MgmxCCN; Mon,  4 May 2020 16:29:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4A9AC88C7F;
	Mon,  4 May 2020 16:29:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2D5AFC0175;
	Mon,  4 May 2020 16:29:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 65C94C0175
 for <iommu@lists.linux-foundation.org>; Mon,  4 May 2020 16:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 544FE88C87
 for <iommu@lists.linux-foundation.org>; Mon,  4 May 2020 16:29:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B-LVvgwHtlFm for <iommu@lists.linux-foundation.org>;
 Mon,  4 May 2020 16:29:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 710E288AD8
 for <iommu@lists.linux-foundation.org>; Mon,  4 May 2020 16:29:15 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id h9so11392351wrt.0
 for <iommu@lists.linux-foundation.org>; Mon, 04 May 2020 09:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/BYU4Om8WCi34VBttwlHwqi6sY2A9tyjvz9dkBW4YR0=;
 b=s6Hn20ig/1KbhienjCm7bWbYtxGwNnasjezCMNITDVyM/NfgWs1dMhB2gCybX/gMQM
 3PvzgyisZ2pcL/5UM64ddSx6TGvAftzzX2OE4x2ldSBevHUIJbL1Lh1SiucuLKAInJzC
 JyGj2737261kvOO484ymYbWd/jxHFDiMYcTkvLmUpxHi1Y6R9OGmzwL+SyZduBlcfchC
 yt06HQpOncV1dier8AcJ71lobnxArlTYPJOBYmytmIEueWGSRW/a8lt5bEx+1Kv93NkY
 QrDTWiKqlp5t4HiJUdr0nvqoLZypO0n42pp908ZiZk6LUi9G3Qz27wXfntChz79dBe0/
 HgwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/BYU4Om8WCi34VBttwlHwqi6sY2A9tyjvz9dkBW4YR0=;
 b=p2LLem9PUHMnoARbt0ajYNwlsibXYo39THjInLAiHfNxV9AgwuuxNiwW3GCVPH64+J
 YwoLyIcjZUTti5GAuZUMiBWJmWzbIb8FcoXs4FVSpy7Sq6OYEeNm6DgraE1u7sWZqOyp
 23jjURgWq5bGyYx1GogRZUvh9eyZ8n6ZgiqRIXW7SWeaqzHQbBBByDGO7qgnpqZ4L7Jk
 PqDzJTIJBrTLENFvPG+Q51h7k3aYrwzxF7TpDHY4JShMu0vIOs1kuk9XM6RXwivn8EOp
 5HYiXSRneTRCacUDUM6xaop1XMBAwZ1inympwEIW329ZFKL3ZT9PN4eMFDNNazcEFfxd
 HkcA==
X-Gm-Message-State: AGi0PuaX0x6Ufa5aTl4c4e/LQRVxjd+FCHzexrkfEPe6b16et3ajIwJw
 g3kmeLuzi/WpYhTacAXVfpUclQ==
X-Google-Smtp-Source: APiQypIHji+0UmZIp3eRiES/RsK7nvGgkSn0DrHKmgTnip/V9mOn0fBeB0vJOAU40Okt9fYQT7236g==
X-Received: by 2002:adf:ed86:: with SMTP id c6mr159739wro.124.1588609753958;
 Mon, 04 May 2020 09:29:13 -0700 (PDT)
Received: from myrica ([2001:171b:226e:c200:c43b:ef78:d083:b355])
 by smtp.gmail.com with ESMTPSA id l5sm13656680wmi.22.2020.05.04.09.29.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 09:29:13 -0700 (PDT)
Date: Mon, 4 May 2020 18:29:03 +0200
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Xu Zaibo <xuzaibo@huawei.com>
Subject: Re: [PATCH v6 01/25] mm: Add a PASID field to mm_struct
Message-ID: <20200504162903.GH170104@myrica>
References: <20200430143424.2787566-1-jean-philippe@linaro.org>
 <20200430143424.2787566-2-jean-philippe@linaro.org>
 <ffe0aca4-575b-98d3-0ba5-88d5e6eb29fe@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ffe0aca4-575b-98d3-0ba5-88d5e6eb29fe@huawei.com>
Cc: devicetree@vger.kernel.org, kevin.tian@intel.com, jgg@ziepe.ca,
 linux-pci@vger.kernel.org, robin.murphy@arm.com, fenghua.yu@intel.com,
 hch@infradead.org, linux-mm@kvack.org, iommu@lists.linux-foundation.org,
 zhangfei.gao@linaro.org, catalin.marinas@arm.com, felix.kuehling@amd.com,
 will@kernel.org, christian.koenig@amd.com,
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

On Mon, May 04, 2020 at 09:52:44AM +0800, Xu Zaibo wrote:
> 
> On 2020/4/30 22:34, Jean-Philippe Brucker wrote:
> > Some devices can tag their DMA requests with a 20-bit Process Address
> > Space ID (PASID), allowing them to access multiple address spaces. In
> > combination with recoverable I/O page faults (for example PCIe PRI),
> > PASID allows the IOMMU to share page tables with the MMU.
> > 
> > To make sure that a single PASID is allocated for each address space, as
> > required by Intel ENQCMD, store the PASID in the mm_struct. The IOMMU
> > driver is in charge of serializing modifications to the PASID field.
> > 
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > ---
> > For the field's validity I'm thinking invalid PASID = 0. In ioasid.h we
> > define INVALID_IOASID as ~0U, but I think we can now change it to 0,
> > since Intel is now also reserving PASID #0 for Transactions without
> > PASID and AMD IOMMU uses GIoV for this too.
> > ---
> >   include/linux/mm_types.h | 4 ++++
> >   1 file changed, 4 insertions(+)
> > 
> > diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> > index 4aba6c0c2ba80..8db6472758175 100644
> > --- a/include/linux/mm_types.h
> > +++ b/include/linux/mm_types.h
> > @@ -534,6 +534,10 @@ struct mm_struct {
> >   		atomic_long_t hugetlb_usage;
> >   #endif
> >   		struct work_struct async_put_work;
> > +#ifdef CONFIG_IOMMU_SUPPORT
> > +		/* Address space ID used by device DMA */
> > +		unsigned int pasid;
> > +#endif
> Maybe '#ifdef CONFIG_IOMMU_SVA ... #endif' is more reasonable?

CONFIG_IOMMU_SVA enables a few helpers but IOMMU drivers don't have to use
them, so I think IOMMU_SUPPORT is more appropriate.

Thanks,
Jean
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
