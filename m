Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A22D1A0C62
	for <lists.iommu@lfdr.de>; Tue,  7 Apr 2020 13:01:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4BDF120444;
	Tue,  7 Apr 2020 11:01:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qRffHhlhbOdE; Tue,  7 Apr 2020 11:01:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5A4F42043C;
	Tue,  7 Apr 2020 11:01:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 400ADC0177;
	Tue,  7 Apr 2020 11:01:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CD813C0177
 for <iommu@lists.linux-foundation.org>; Tue,  7 Apr 2020 11:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B99252043C
 for <iommu@lists.linux-foundation.org>; Tue,  7 Apr 2020 11:01:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yMWGVIQsDC4P for <iommu@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 11:01:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 60A562041C
 for <iommu@lists.linux-foundation.org>; Tue,  7 Apr 2020 11:01:17 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id d77so1287433wmd.3
 for <iommu@lists.linux-foundation.org>; Tue, 07 Apr 2020 04:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7e9JekbMjRN4qPP6TudcyC7igTWSIzN2Q0/JhAQisHk=;
 b=duiM5LY4uZHmex4Jt6wly7w4b8nz+kynRNmoYgzVHI2ALnmCS9o3l7eRxd0wjBwdyV
 gbkolDuuheNfRxLCT24aNDLzV/Z2m9v70GkrEG6cWYU0/omnLSKHNfvfTG3gwej2D9H1
 4f+gjsxAGivrRr9lb70weK10C4ni2WemjUf5V1iDy6Xawp2sdtat5DSgNf5panWRyt0h
 rcRw1t4IDFCYct9gfq/Dnia8VNNMyQfOAST2/TqQExF+77UzzScDP5wRwIrk4ShggYV6
 BAymg2P98k6WxZdHTpRYAoZipthquxivlmzUzDPOKHxUvbZk35ywy5kODtjk+5RLjD56
 A1ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7e9JekbMjRN4qPP6TudcyC7igTWSIzN2Q0/JhAQisHk=;
 b=KFpYogjjdzmVYNjx2g63lUZskaqqHqlSQLwHQeyAfOHFoypgM+yXS2ZH2+WS1OOsx0
 XCOLkLHcEPxUdD8n6+Gt/NRpQkFw6BidHIa9NFZQfdPPidXeK1WxN1sPLdnTQBABCpkb
 hvNHpzmA3NWaMcgTL7JE4ipcfMYWJw1x448RGBuGbTps0AjaiyOFEWYE1eXKJE7vEqen
 wsmss4GLp9hndnv/zCjMDDLuUtNuFxc/26ccR7ku8gWUx1gnpnOQtzf7GoarvGYliamK
 Vj9Hh+kKcAkuOB3jMc/vq4X67mo2sL523QK1IcqekFfTn8wZxegO7F9nHa1LsTiVRHI8
 Z5GQ==
X-Gm-Message-State: AGi0PuYWbWmH5TKt2LFc2oEYs/cpVQpiYmsBTldGnI4sHFghFTgzt+Ee
 1SJ0Y04JAmqVvSBuSe3sekPQLw==
X-Google-Smtp-Source: APiQypJpn4ESFTAnvOZvBKGgLWqORpMqhwZ+ndImgbUVp841Jgn4bvs28o6JGa3FczBgoHt12e4o+A==
X-Received: by 2002:a1c:2489:: with SMTP id k131mr1905062wmk.86.1586257275550; 
 Tue, 07 Apr 2020 04:01:15 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:6097:1406:6470:33b5])
 by smtp.gmail.com with ESMTPSA id u16sm30205510wro.23.2020.04.07.04.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2020 04:01:14 -0700 (PDT)
Date: Tue, 7 Apr 2020 13:01:07 +0200
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
Subject: Re: [PATCH 03/10] iommu/ioasid: Introduce per set allocation APIs
Message-ID: <20200407110107.GA285264@myrica>
References: <1585158931-1825-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1585158931-1825-4-git-send-email-jacob.jun.pan@linux.intel.com>
 <20200401134745.GE882512@myrica>
 <20200406130245.690cfe15@jacob-builder>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200406130245.690cfe15@jacob-builder>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Alex Williamson <alex.williamson@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>, Jonathan Cameron <jic23@kernel.org>
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

On Mon, Apr 06, 2020 at 01:02:45PM -0700, Jacob Pan wrote:
> > > +	sdata = kzalloc(sizeof(*sdata), GFP_KERNEL);
> > > +	if (!sdata)
> > > +		return -ENOMEM;  
> > 
> > I don't understand why we need this structure at all, nor why we need
> > the SID. Users have already allocated an ioasid_set, so why not just
> > stick the content of ioasid_set_data in there, and pass the
> > ioasid_set pointer to ioasid_alloc()?
> > 
> 
> My thinking was that ioasid_set is an opaque user token, e.g. we use mm
> to identify a common set belong to a VM.
> 
> This sdata is an IOASID internal structure for managing & servicing per
> set data. If we let user fill in the content, some of the entries need
> to be managed by the IOASID code under a lock.

We don't have to let users fill the content. A bit like iommu_domain:
device drivers don't modify it, they pass it to iommu_map() rather than
passing a domain ID.

> IMO, not suitable to let user allocate and manage.
> 
> Perhaps we should rename struct ioasid_set to ioasid_set_token?

Is the token actually used anywhere?  As far as I can tell VFIO does its
own uniqueness check before calling ioasid_alloc_set(), and consumers of
notifications don't read the token.

> 
> /**
>  * struct ioasid_set_data - Meta data about ioasid_set
>  *
>  * @token:	Unique to identify an IOASID set
>  * @xa:		XArray to store ioasid_set private ID to
> system-wide IOASID
>  *		mapping
>  * @max_id:	Max number of IOASIDs can be allocated within the set
>  * @nr_id	Number of IOASIDs allocated in the set
>  * @sid		ID of the set
>  */
> struct ioasid_set_data {
> 	struct ioasid_set *token;
> 	struct xarray xa;
> 	int size;
> 	int nr_ioasids;
> 	int sid;
> 	struct rcu_head rcu;
> };

How about we remove the current ioasid_set, call this structure ioasid_set
instead of ioasid_set_data, and have ioasid_alloc_set() return it, rather
than requiring users to allocate the ioasid_set themselves?

	struct ioasid_set *ioasid_alloc_set(ioasid_t quota):

This way ioasid_set is opaque to users (we could have the definition in
ioasid.c), but it can be passed to ioasid_alloc() and avoids the lookup by
SID. Could also add the unique token as a void * argument to
ioasid_alloc_set(), if needed.

Thanks,
Jean
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
