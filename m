Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 004751A88A6
	for <lists.iommu@lfdr.de>; Tue, 14 Apr 2020 20:09:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id ACB3F86E5E;
	Tue, 14 Apr 2020 18:09:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Ru+E9aRCiz5; Tue, 14 Apr 2020 18:09:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8D17986E77;
	Tue, 14 Apr 2020 18:09:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 78620C0172;
	Tue, 14 Apr 2020 18:09:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 732FEC1D7D
 for <iommu@lists.linux-foundation.org>; Tue, 14 Apr 2020 18:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 691EF21519
 for <iommu@lists.linux-foundation.org>; Tue, 14 Apr 2020 18:09:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vzMqfobhadC7 for <iommu@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 18:09:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 by silver.osuosl.org (Postfix) with ESMTPS id A0C6521080
 for <iommu@lists.linux-foundation.org>; Tue, 14 Apr 2020 18:09:14 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id l25so14347285qkk.3
 for <iommu@lists.linux-foundation.org>; Tue, 14 Apr 2020 11:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=bv0sJf01GOa0wIzpOx9SRUfmEHLHh5Wp99C/Vrgdaec=;
 b=HUV9qAl0/LTHa4gW9R5GB8bZskgMoquMycxLWoNqVXVK2lCPXRRchgd9fNWmRJ3r3E
 MwOpBF6IYEAIRmh+0P+Mk/Xdy5ihB9c56BGZ9huMOY7437gGh4cXj2ES77WCdjN3h14P
 vz4I9nCHk4olhkup2TXyZYzBKURBuBpg2EVTYcri8bZwVCHw5clEERw7k1EtxwCQTnnM
 VJSbHXiqAULOv3ywp1xrIzqfxDneUHsXKLo7wHnHwkX7qU6WFdjY2E7rloSUWnmAC5gN
 4MMiLhwcwPZJrM0qv+cchcfFMGuVM8+32TSi5HJ9+6a8/GOL1PH/AfPEODAh7ce0zWHj
 Orfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bv0sJf01GOa0wIzpOx9SRUfmEHLHh5Wp99C/Vrgdaec=;
 b=fm1k17JIMAjNZ+MiYlrwRHd544ZJvZg9dKLiJV/x3aADc+lGQn5AOBXvuVgLARrEKc
 t+YhOdHu3dW4/klRmpb5Rg9JX0UC9LAOnJpu0CbiyBifg8c+/1/bp12svpLfydP+MB4F
 fdVFGOMJ9YpWd55gwe6mFehKmrIMx3Xxk3j1ixh+Lar9sfh6uPaXRidANevpCB+Cjyok
 C9jLcCaMuD2SVrBtoi6BDCB1GejC9YKjdpM0/oBBAAKx4iBSp/DOVP9luTeJQ1oxsjoy
 P1xTZsj4EkJ4YYtW2gdGnomFQqEQgNWVEhn6iZBgNJVElH9tgb3H4gx91UHZH4nWZSBp
 Qblw==
X-Gm-Message-State: AGi0PuaHnudZz7TKct2OP3zcRdqMTCUslJ8atPlGSFmdx7wXfyY1ZEMD
 48VQzkunoMb2Eo/ipYAy0KRZlA==
X-Google-Smtp-Source: APiQypLF3T0ctlDMYDCZmNS5QXnrk26ya+xUobfqsrIExRvDdUeoVWUu8wspkPshY2Cg+OHu4MKS2Q==
X-Received: by 2002:a37:8645:: with SMTP id i66mr23325550qkd.229.1586887753646; 
 Tue, 14 Apr 2020 11:09:13 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id f13sm11354811qti.47.2020.04.14.11.09.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 Apr 2020 11:09:13 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jOPzk-0007ib-Gs; Tue, 14 Apr 2020 15:09:12 -0300
Date: Tue, 14 Apr 2020 15:09:12 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v5 01/25] mm/mmu_notifiers: pass private data down to
 alloc_notifier()
Message-ID: <20200414180912.GH5100@ziepe.ca>
References: <20200414170252.714402-1-jean-philippe@linaro.org>
 <20200414170252.714402-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200414170252.714402-2-jean-philippe@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: devicetree@vger.kernel.org, kevin.tian@intel.com,
 Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pci@vger.kernel.org,
 robin.murphy@arm.com, linux-mm@kvack.org, iommu@lists.linux-foundation.org,
 Dimitri Sivanich <sivanich@sgi.com>, catalin.marinas@arm.com,
 zhangfei.gao@linaro.org, will@kernel.org, christian.koenig@amd.com,
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

On Tue, Apr 14, 2020 at 07:02:29PM +0200, Jean-Philippe Brucker wrote:
> The new allocation scheme introduced by commit 2c7933f53f6b
> ("mm/mmu_notifiers: add a get/put scheme for the registration") provides
> a convenient way for users to attach notifier data to an mm. However, it
> would be even better to create this notifier data atomically.
> 
> Since the alloc_notifier() callback only takes an mm argument at the
> moment, some users have to perform the allocation in two times.
> alloc_notifier() initially creates an incomplete structure, which is
> then finalized using more context once mmu_notifier_get() returns. This
> second step requires extra care to order memory accesses against live
> invalidation.
> 
> The IOMMU SVA module, which attaches an mm to multiple devices,
> exemplifies this situation. In essence it does:
> 
> 	mmu_notifier_get()
> 	  alloc_notifier()
> 	     A = kzalloc()
> 	  /* MMU notifier is published */
> 	A->ctx = ctx;				// (1)
> 	device->A = A;
> 	list_add_rcu(device, A->devices);	// (2)
> 
> The invalidate notifier, which may start running before A is fully
> initialized, does the following:
> 
> 	io_mm_invalidate(A)
> 	  list_for_each_entry_rcu(device, A->devices)
> 	    device->invalidate(A->ctx)

This could probably also have been reliably fixed by not having A->ctx
be allocated memory, but inlined into the notifier struct

But I can't think of a down side to not add a params either.

Reviewed-by: Jason Gunthorpe <jgg@mellanox.com>

Regards,
Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
