Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C52491B034B
	for <lists.iommu@lfdr.de>; Mon, 20 Apr 2020 09:42:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 470E4204EF;
	Mon, 20 Apr 2020 07:42:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BfDvilLPKMJO; Mon, 20 Apr 2020 07:42:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D5616204EA;
	Mon, 20 Apr 2020 07:42:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C816DC1D8D;
	Mon, 20 Apr 2020 07:42:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B543FC0177
 for <iommu@lists.linux-foundation.org>; Mon, 20 Apr 2020 07:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9EC1386704
 for <iommu@lists.linux-foundation.org>; Mon, 20 Apr 2020 07:42:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mT8ZAlQPWU0V for <iommu@lists.linux-foundation.org>;
 Mon, 20 Apr 2020 07:42:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 922778634E
 for <iommu@lists.linux-foundation.org>; Mon, 20 Apr 2020 07:42:24 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id g13so8797942wrb.8
 for <iommu@lists.linux-foundation.org>; Mon, 20 Apr 2020 00:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=36LtjihBEpeBnaRGeeCm9e2L3d20jrMG7L1AL/HArJs=;
 b=BM8Iccy/hIQbCpSekYbFcZATX4MvhvRHEo8t56sYYDBHLuWrWlNfN2U/Avqh8pAzQ+
 lJSChUqVOtITG+ntElIAo3FofQYlSUeJmVFTj1QctC3aH4uQ5UOifop/IzHxEXYnZ5my
 opGELuSrSZd/x7koJ8jWqGqe0lytTCYPvTb7bSWeBNbpH/ZOHDSjLzxqvp1xpOJsbc7o
 xGsbkEr+LTYIBgtKOpVnk5Pox8r0hmqVt3bRtQ6GUZafBrjVD4r2u3tGSKQbcyjfOLch
 9Sfd2Iw3VJ/3lDfpUqoBIiiH3MRh0hqtXjIK8Ip29Za7xcLJ1b9QXuz0Pl6RJ3xDyOUI
 iYMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=36LtjihBEpeBnaRGeeCm9e2L3d20jrMG7L1AL/HArJs=;
 b=jbK+F6PCb1Ioyjly9+sttHGQL8k7D6PmsSuO8/G6QFLQfYfq1mXOGdFV8SQpcRnWTf
 XHerRXb9aFxtdZjowjqkDfZz8Fhf8jO7ztQz3Zh+/yU04wmGqutaYoyswO3qIwAnRMC/
 dU7PJi6pQKlEcBxJDWOdzbzR+VaCn9ru9fUW9phWVMM20ywdvCmy/SMsr3ducR1da+Dk
 8plfBzeD0JTBxpatgOm8LYHKBNE6M7Zx5X3pSoaccRSpvSZEXtmwl7xxqWbdMaY9J4rU
 sZQTE2rraxnzr5kpETNnsQ8McVeE2ySHIdD0jRo9lZaqxQd2zSJo0r2cfXKIVrHJv3y+
 eH2g==
X-Gm-Message-State: AGi0PuZN842IAJEDQQP8toFhDFYd/8sQIhedk7etL+0TCxlJNRmjz7vY
 mTYHXr9ZGMPOc/Iw+h8K0WjhbQ==
X-Google-Smtp-Source: APiQypIBGqen1kzX4d4Wf5UYEkYdzKCnAPaaEvwxdtpe+zlIYgN/+aoVVamwm9Ox3hy3wg9aLlAaUA==
X-Received: by 2002:a5d:6107:: with SMTP id v7mr16380670wrt.270.1587368542719; 
 Mon, 20 Apr 2020 00:42:22 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id i25sm203507wml.43.2020.04.20.00.42.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 00:42:22 -0700 (PDT)
Date: Mon, 20 Apr 2020 09:42:13 +0200
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v5 02/25] iommu/sva: Manage process address spaces
Message-ID: <20200420074213.GA3180232@myrica>
References: <20200414170252.714402-1-jean-philippe@linaro.org>
 <20200414170252.714402-3-jean-philippe@linaro.org>
 <20200416072852.GA32000@infradead.org>
 <20200416085402.GB1286150@myrica>
 <20200416121331.GA18661@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200416121331.GA18661@infradead.org>
Cc: devicetree@vger.kernel.org, kevin.tian@intel.com, jgg@ziepe.ca,
 linux-pci@vger.kernel.org, robin.murphy@arm.com, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, catalin.marinas@arm.com,
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

On Thu, Apr 16, 2020 at 05:13:31AM -0700, Christoph Hellwig wrote:
> On Thu, Apr 16, 2020 at 10:54:02AM +0200, Jean-Philippe Brucker wrote:
> > On Thu, Apr 16, 2020 at 12:28:52AM -0700, Christoph Hellwig wrote:
> > > > +	rcu_read_lock();
> > > > +	hlist_for_each_entry_rcu(bond, &io_mm->devices, mm_node)
> > > > +		io_mm->ops->invalidate(bond->sva.dev, io_mm->pasid, io_mm->ctx,
> > > > +				       start, end - start);
> > > > +	rcu_read_unlock();
> > > > +}
> > > 
> > > What is the reason that the devices don't register their own notifiers?
> > > This kinds of multiplexing is always rather messy, and you do it for
> > > all the methods.
> > 
> > This sends TLB and ATC invalidations through the IOMMU, it doesn't go
> > through device drivers
> 
> I don't think we mean the same thing, probably because of my rather
> imprecise use of the word device.
> 
> What I mean is that the mmu_notifier should not be embedded into the
> io_mm structure (whch btw, seems to have a way to generic name, just
> like all other io_* prefixed names), but instead into the
> iommu_bond structure.  That avoid the whole multiplexing layer.

Right, I can see the appeal. I still like having a single mmu notifier per
mm because it ensures we allocate a single PASID per mm (as required by
x86). I suppose one alternative is to maintain a hashtable of mm->pasid,
to avoid iterating over all bonds during allocation.

Thanks,
Jean
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
