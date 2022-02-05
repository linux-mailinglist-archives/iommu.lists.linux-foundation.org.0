Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF7F4AA6B6
	for <lists.iommu@lfdr.de>; Sat,  5 Feb 2022 06:10:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEE6F4090C;
	Sat,  5 Feb 2022 05:10:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ak3DvbRvbXyi; Sat,  5 Feb 2022 05:10:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 0C0454094D;
	Sat,  5 Feb 2022 05:10:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C82EAC0073;
	Sat,  5 Feb 2022 05:10:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 84EC1C000B
 for <iommu@lists.linux-foundation.org>; Sat,  5 Feb 2022 05:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EEFE82423
 for <iommu@lists.linux-foundation.org>; Sat,  5 Feb 2022 05:10:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DjJ_Y8PujCVI for <iommu@lists.linux-foundation.org>;
 Sat,  5 Feb 2022 05:10:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8DFEF82422
 for <iommu@lists.linux-foundation.org>; Sat,  5 Feb 2022 05:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644037816; x=1675573816;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JcX/1EZirCjM105wSMia+he9amGan4vf2Bw07F+RiJM=;
 b=Qxd9jDC6yQpwGIL5UPkzr/yRWQ6aFGRZ7Du/5msTHwNRyk8D+QCkn3X9
 CVLyxrkmf21B4zJrYUoZTgAHddNOXVMm3ucyAXZ9ccH463Hd5diw5QuE/
 LqohRIC/oR0cBlpEDNEcd7wra1i4AVABfTp7kgLpvwC93ktvd8S/eRFIy
 KLR2honnftt2z8pFqhYU2uiPuoSq4okBJQPSvsSpyZ2jSLRJ7N4csWkoe
 S6+Bp6aKg5XWXNbcV3jycT8AE5QT6q7dtXW+K480/DZyIpdX0Uinaato4
 Bo8vH9hA+B1UgMs9WlXaQKehcogmh9GDWzKtSIcQc+cLpFQvR9yyA+4ts g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10248"; a="248702591"
X-IronPort-AV: E=Sophos;i="5.88,344,1635231600"; d="scan'208";a="248702591"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 21:10:15 -0800
X-IronPort-AV: E=Sophos;i="5.88,344,1635231600"; d="scan'208";a="539426486"
Received: from otcwcpicx3.sc.intel.com ([172.25.55.73])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 21:10:15 -0800
Date: Fri, 4 Feb 2022 21:10:14 -0800
From: Fenghua Yu <fenghua.yu@intel.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v3 05/11] iommu/sva: Assign a PASID to mm on PASID
 allocation and free it on mm exit
Message-ID: <Yf4Gtm5pu+e2whSE@otcwcpicx3.sc.intel.com>
References: <20220128202905.2274672-1-fenghua.yu@intel.com>
 <20220128202905.2274672-6-fenghua.yu@intel.com>
 <6ace7131-4671-6956-944f-df01e5d63470@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6ace7131-4671-6956-944f-df01e5d63470@linux.intel.com>
Cc: Ravi V Shankar <ravi.v.shankar@intel.com>, Tony Luck <tony.luck@intel.com>,
 Ashok Raj <ashok.raj@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86 <x86@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>
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

Hi, Baolu,
On Sat, Feb 05, 2022 at 11:50:59AM +0800, Lu Baolu wrote:
> Hi Fenghua,
> 
> On 2022/1/29 4:28, Fenghua Yu wrote:
> > diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> > index 92fea3fbbb11..ef03b2176bbd 100644
> > --- a/drivers/iommu/intel/iommu.c
> > +++ b/drivers/iommu/intel/iommu.c
> > @@ -4781,7 +4781,7 @@ static int aux_domain_add_dev(struct dmar_domain *domain,
> >   link_failed:
> >   	spin_unlock_irqrestore(&device_domain_lock, flags);
> >   	if (list_empty(&domain->subdevices) && domain->default_pasid > 0)
> > -		ioasid_put(domain->default_pasid);
> > +		ioasid_free(domain->default_pasid);
> >   	return ret;
> >   }
> > @@ -4811,7 +4811,7 @@ static void aux_domain_remove_dev(struct dmar_domain *domain,
> >   	spin_unlock_irqrestore(&device_domain_lock, flags);
> >   	if (list_empty(&domain->subdevices) && domain->default_pasid > 0)
> > -		ioasid_put(domain->default_pasid);
> > +		ioasid_free(domain->default_pasid);
> >   }
> >   static int prepare_domain_attach_device(struct iommu_domain *domain,
> 
> The domain->default_pasid is not relevant to SVA and it's being cleaned
> up by another series. No need to take care of it in this series.

Because ioasid_put() is renamed to ioasid_free() in this patch, without
above changes, this series cannot be compiled.

Thomas and I discussed how to handle aux_domain while you will remove
the entire aux_domain code (https://lore.kernel.org/lkml/87zgnf29op.ffs@tglx/).
The above changes are minimal and temporary changes to compile this series.
The changes will be removed along with the entire aux_domain by your
removing aux_domain series later in 5.18.

Thanks.

-Fenghua

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
