Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC0E1A33C9
	for <lists.iommu@lfdr.de>; Thu,  9 Apr 2020 14:08:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B87B186B04;
	Thu,  9 Apr 2020 12:08:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id udNTqimrnv2R; Thu,  9 Apr 2020 12:08:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2B11C87A79;
	Thu,  9 Apr 2020 12:08:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 173DEC0177;
	Thu,  9 Apr 2020 12:08:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DFC03C0177
 for <iommu@lists.linux-foundation.org>; Thu,  9 Apr 2020 12:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C7B8A20500
 for <iommu@lists.linux-foundation.org>; Thu,  9 Apr 2020 12:08:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QXxibOc2LMNz for <iommu@lists.linux-foundation.org>;
 Thu,  9 Apr 2020 12:08:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 217CB204BC
 for <iommu@lists.linux-foundation.org>; Thu,  9 Apr 2020 12:08:24 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id m67so3574744qke.12
 for <iommu@lists.linux-foundation.org>; Thu, 09 Apr 2020 05:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=p3A0YxOLclXhce0bxw4Lb+RE5M+JSHe3LCSzA/92DjA=;
 b=XHFuwAtZnKrasnYcs6QMGwed9UQ6rVTAA51ouWtWUS7baC1anQa/E+eIHmECNfqFJv
 DYw9dVRnIskEN9pJYduXkZ6NsngGq2hPdd+P73jf0Y6M0egZ34BVCTH/QetLSLKlwINT
 y/Eb4gj1BI8Sx7BZdpOJU+Cuukg/cB3Fi1hgz95CgjlNMCwZY1LFbHefwDvSrmQ6ELRy
 LAf+ei9i4OxTgSrJhweNxDJ6FeasU8NztV5QayglFLy1wkVfOstnIPgfzC6gVxtDLeiR
 nhn22MYVPPUTCAe7jh9QIQUMQnvBaKEdKBhY3YcoZb9mUF7Ui/32qrHr2T/6KkrNOpDn
 WnWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=p3A0YxOLclXhce0bxw4Lb+RE5M+JSHe3LCSzA/92DjA=;
 b=ncLUgfmIPXfD47L6wNmbRMFdstAXCgvLeBhUzXZwDg6AtLaM5b8JxURrlwpDVwvUmL
 LE8yBCbPCcHwIKWL24WjU/2ulmra1plpXsBd/5gTrVCf1V1i6UtBrtlO2suurO+ZGnAK
 mNKWpyb0OffALVRUA7oORoCSJ6+Mn/KuqRfyOjtDKuYq6FeyJf5Jxc7tmcUe0+RfPTN4
 jvzN4f8QcczicHgNnHkgeG3YE+c1L208figOEKolrWaNopb4abyRx5ZRSdJOui6FxovN
 LJqSeM+Id0dPFRnQ33l9xiCht7YwYb2Fu3J8Wi8PKu0Fw7SzyaEmXOaKFSE0jxdzx121
 3YhA==
X-Gm-Message-State: AGi0Pua3pqdiXnaleCOKSK0OncYNlg0Tyi2GSFMVzJq6cIG+nWtRkxcG
 0NG6CEEUs5kQIsQS1Bv/gYruWA==
X-Google-Smtp-Source: APiQypKYNYWKZ1z260/Msbo/Dg96PkaWtqJoUKb+YgolniiWsYAXqTz43fPAaIoymCv9u9obkQXzhA==
X-Received: by 2002:a37:9f50:: with SMTP id i77mr11399932qke.139.1586434103183; 
 Thu, 09 Apr 2020 05:08:23 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id l60sm21555409qtd.35.2020.04.09.05.08.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 09 Apr 2020 05:08:22 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jMVyn-0008Bh-Ur; Thu, 09 Apr 2020 09:08:21 -0300
Date: Thu, 9 Apr 2020 09:08:21 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
Subject: Re: [PATCH 0/2] iommu: Remove iommu_sva_ops::mm_exit()
Message-ID: <20200409120821.GE11886@ziepe.ca>
References: <20200408140427.212807-1-jean-philippe@linaro.org>
 <20200408113552.7888bfee@jacob-builder>
 <20200408190226.GA11886@ziepe.ca>
 <20200408143552.57f5837c@jacob-builder>
 <20200408223218.GC11886@ziepe.ca>
 <20200408164802.155a69e3@jacob-builder>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408164802.155a69e3@jacob-builder>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, arnd@arndb.de, "Yu,
 Fenghua" <fenghua.yu@intel.com>, gregkh@linuxfoundation.org,
 iommu@lists.linux-foundation.org, zhangfei.gao@linaro.org,
 linux-accelerators@lists.ozlabs.org
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

On Wed, Apr 08, 2020 at 04:48:02PM -0700, Jacob Pan wrote:
> > Yes, this is the proper way, when the DMA is stopped and no use of the
> > PASID remains then you can drop the mmu notifier and release the PASID
> > entirely. If that is linked to the lifetime of the FD then forget
> > completely about the mm_struct lifetime, it doesn't matter..
> > 
> Got everything above, thanks a lot.
> 
> If everything is in order with the FD close. Why do we need to 
> "ask IOMMU drivers to silently abort DMA and Page Requests in the
> meantime." in mm_exit notifier? This will be done orderly in unbind
> anyway.

I thought this is exactly what Jean-Phillippe is removing here, it is
a bad idea for the reasons he explained.

> > > Enforcing unbind upon FD close might be a precarious path, perhaps
> > > that is why we have to deal with out of order situation?  
> > 
> > How so? You just put it in the FD release function :)
> 
> I was thinking some driver may choose to defer unbind in some workqueue
> etc.

Doesn't really change anything, the lifetime of the PASID wouuld be
the lifetime of the notifier and the bind, and DMA can't continue
without the notifier registered.

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
