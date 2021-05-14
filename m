Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A63380C1E
	for <lists.iommu@lfdr.de>; Fri, 14 May 2021 16:45:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 069E8606DF;
	Fri, 14 May 2021 14:44:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9bLU-5bwdki9; Fri, 14 May 2021 14:44:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17DCA605FE;
	Fri, 14 May 2021 14:44:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DC5FFC0001;
	Fri, 14 May 2021 14:44:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7CC0FC0001
 for <iommu@lists.linux-foundation.org>; Fri, 14 May 2021 14:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6647560716
 for <iommu@lists.linux-foundation.org>; Fri, 14 May 2021 14:44:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9tTjyh-Abd65 for <iommu@lists.linux-foundation.org>;
 Fri, 14 May 2021 14:44:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 97EBF605FE
 for <iommu@lists.linux-foundation.org>; Fri, 14 May 2021 14:44:45 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id t20so18062536qtx.8
 for <iommu@lists.linux-foundation.org>; Fri, 14 May 2021 07:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5eRvTdeEB4OFHRkGyw/FepnZIZ1CoxvAuK8I7ThmVnY=;
 b=nRkdu7k2xQ+YoBCvbAK24g2UZnBtDHdW77UuZWq1TzE1ce/i2vSxDI3PdfKI5Jsm9d
 JRRwdxdT0Bs39ZNeLlzVgpmazAiVXgM+zzr8ziiO7KgyEikyw7RpioDCezi1XKjxoGNP
 POVVlFsCMQ9vTbPgGl7v6QzGYQWWYI9OJewyjQmQ3WwsxgYI24sQ6TMMkjKiiYwVXW5x
 8+ipkG/ael3qLVrlHufx0H2LgX6Tqpg0Z8QC+AqA4v8RN6S8q3zVrRqgoth1O4jzTlAj
 jwIHjEFqIPmdguSTbvmMbkB3B5avjXAM3F3JkUPS+VqLm2pQ4PjA0Yf2BtzRnkcYpGtT
 aUTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5eRvTdeEB4OFHRkGyw/FepnZIZ1CoxvAuK8I7ThmVnY=;
 b=polxw9JSjuwvhQs5Ubj5DMEKI8f4PXMIoGUQ+tFJCM0TERdvdVz9MlM72l7pI0JVWz
 HLoHQN9+Cy8OfVcjXrj+QVY0EsNgPAmwUOhRXl3TNFUkgzsGokyFgd1LdCYlmy2l36Dv
 flj6Q+eFnEs+MCKRFhcKDF0LIr8FJqYHtMSsLUZmNGb4Mc/eRDKp5UAopE0NhS9NGC0L
 0ue6fhnjCoHBR1IVCbxs5MZVYdUFEkCkXD7gHfOa4wTgVUj1cuUuBNbgvK4LQlvxxbTr
 9bi5Q39YMgvRkiyt8F5COiuyS9q7bzOxaBfjDrR5EALu8TuYqBvUXa5Uwo75FF/B6Zlf
 TESA==
X-Gm-Message-State: AOAM530MJ6WvzSUq1+TUTco84Ci1/tW9hcPEDL9439JutvEBbv35Jvwy
 IeWe2RyFClWGNOKG6pTBUmSp7w==
X-Google-Smtp-Source: ABdhPJxXWxgtyCMpLAybGYmVkwL/O8mVvUjGMWW8nfKwX9BgEHmZSiHUjb0Crr7tgdUgMOvc0inVcg==
X-Received: by 2002:a05:622a:1493:: with SMTP id
 t19mr43119374qtx.147.1621003484390; 
 Fri, 14 May 2021 07:44:44 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-47-55-113-94.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.113.94])
 by smtp.gmail.com with ESMTPSA id q7sm4886079qki.17.2021.05.14.07.44.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 07:44:43 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1lhZ3T-007Shk-Ai; Fri, 14 May 2021 11:44:43 -0300
Date: Fri, 14 May 2021 11:44:43 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 3/6] vfio: remove the unused mdev iommu hook
Message-ID: <20210514144443.GN1096940@ziepe.ca>
References: <20210510065405.2334771-1-hch@lst.de>
 <20210510065405.2334771-4-hch@lst.de>
 <20210510155454.GA1096940@ziepe.ca>
 <MWHPR11MB1886E02BF7DE371E9665AA328C519@MWHPR11MB1886.namprd11.prod.outlook.com>
 <20210513120058.GG1096940@ziepe.ca>
 <MWHPR11MB18863613CEBE3CDEEB86F4FC8C509@MWHPR11MB1886.namprd11.prod.outlook.com>
 <20210514133939.GL1096940@ziepe.ca>
 <MWHPR11MB1886AE36746C8F82553471088C509@MWHPR11MB1886.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MWHPR11MB1886AE36746C8F82553471088C509@MWHPR11MB1886.namprd11.prod.outlook.com>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Will Deacon <will@kernel.org>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>, Christoph Hellwig <hch@lst.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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

On Fri, May 14, 2021 at 02:28:44PM +0000, Tian, Kevin wrote:
> Well, I see what you meant now. Basically you want to make IOASID 
> as the first-class object in the entire iommu stack, replacing what 
> iommu domain fulfill todays. 

Alternatively you transform domain into being a full fledged IOASID.
I don't know which path works out to be a better patch series.

> Our original proposal was still based on domain-centric philosophy
> thus containing IOASID and its routing info only in the uAPI layer
> of /dev/ioasid and then connecting to domains.

Where do the domains come from though? You still have to hack hack all
the drivers to create dummy domains to support this plan, and in the
process PASID is pretty hobbled as an actual API if every PASID
instance requires a wonky dummy struct device and domain.

> btw are you OK with our ongoing uAPI proposal still based on domain
> flavor for now? the uAPI semantics should be generic regardless of 
> how underlying iommu interfaces are designed. At least separate
> uAPI discussion from iommu ops re-design.

The most important thing is the uAPI, you don't get to change that later.

The next most is the driver facing API.

You can figure out the IOMMU layer internals in stages.

Clearly IOASID == domain today as domain is kind of half a
IOASID. When you extend to PASID and other stuff I think you have
little choice but to make a full IOASID more first class.

Dummy domains are a very poor substitute.

In my experiance these kinds of transformations can usually be managed
as "just alot of typing". Usually the old driver code structure can be
kept enough to not break it while reorganizing.

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
