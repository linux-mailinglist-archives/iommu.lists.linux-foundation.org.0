Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C7DBDA40
	for <lists.iommu@lfdr.de>; Wed, 25 Sep 2019 10:52:32 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A6979C75;
	Wed, 25 Sep 2019 08:52:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8B139B1F
	for <iommu@lists.linux-foundation.org>;
	Wed, 25 Sep 2019 08:52:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id EDF367C
	for <iommu@lists.linux-foundation.org>;
	Wed, 25 Sep 2019 08:52:18 +0000 (UTC)
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
	[209.85.210.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6E2F4C01F2E8
	for <iommu@lists.linux-foundation.org>;
	Wed, 25 Sep 2019 08:52:18 +0000 (UTC)
Received: by mail-pf1-f197.google.com with SMTP id z13so3479478pfr.15
	for <iommu@lists.linux-foundation.org>;
	Wed, 25 Sep 2019 01:52:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=7guDYhVk5y9jI4XUS0aqeg/UFoHlnPDX75uAbJwUN6E=;
	b=MWlknsUHrLpzlZFFyKn30FvhliSFhpefq9zwXDFbCDTQ8xdX5sOXK7cGYxevNVCZJT
	dB/W4X+4bdyXsX/W7zDcofoP1iGIURNMb7eFhvOe3n+p4iwdAgyygc5AfMDGXlb67tRa
	5j4XL0vP/oM+3YvjmMu0QG3FapjZdwsdHSqq33bEMm40YFMP5MoDNzB/DN4tkUpS+vwb
	tHQKbkLrTVA9qElXhzaX5dL+mbXtw6S1fnhKPlTPxiJKSEOOVFh0UhI9VKhwHqe8x9A+
	TGiTju66fjfrdscrGeAX0SscepT7eEHY9bjH5/tAeEOz81Zc511wCXg89nRGxy37Z+nS
	f09g==
X-Gm-Message-State: APjAAAX7ZNomxCQQ8oTC9FfJdEioOiKtdPOS8I1KxUBBMPmV4uqt43PG
	sMqvzBMwlYTXVCc66JePb5wgjivF3HgSdqM+h1+tfEK/RTOXUScKPibHroDdIbHBEOM6TlWbMxc
	civ5LsshnCtaY4YEeGuewxeg5JnhFWw==
X-Received: by 2002:a63:1918:: with SMTP id z24mr7420739pgl.94.1569401537746; 
	Wed, 25 Sep 2019 01:52:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzDN/t3bbGYbbRSFZVuna1qJhynbYShMjRFkCYwC5AswL4W0unwsLCKht5cqU+I7uZouEAN8A==
X-Received: by 2002:a63:1918:: with SMTP id z24mr7420718pgl.94.1569401537447; 
	Wed, 25 Sep 2019 01:52:17 -0700 (PDT)
Received: from xz-x1 ([209.132.188.80])
	by smtp.gmail.com with ESMTPSA id h8sm4588936pfo.64.2019.09.25.01.52.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 25 Sep 2019 01:52:16 -0700 (PDT)
Date: Wed, 25 Sep 2019 16:52:04 +0800
From: Peter Xu <peterx@redhat.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [RFC PATCH 0/4] Use 1st-level for DMA remapping in guest
Message-ID: <20190925085204.GR28074@xz-x1>
References: <20190923122454.9888-1-baolu.lu@linux.intel.com>
	<20190923122715.53de79d0@jacob-builder>
	<20190923202552.GA21816@araj-mobl1.jf.intel.com>
	<AADFC41AFE54684AB9EE6CBC0274A5D19D58D1F1@SHSMSX104.ccr.corp.intel.com>
	<dfd9b7a2-5553-328a-08eb-16c8a3a2644e@linux.intel.com>
	<20190925065640.GO28074@xz-x1>
	<AADFC41AFE54684AB9EE6CBC0274A5D19D58F4A3@SHSMSX104.ccr.corp.intel.com>
	<20190925074507.GP28074@xz-x1>
	<AADFC41AFE54684AB9EE6CBC0274A5D19D58F5F5@SHSMSX104.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D58F5F5@SHSMSX104.ccr.corp.intel.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Alex Williamson <alex.williamson@redhat.com>, "Raj,
	Ashok" <ashok.raj@intel.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, "Kumar,
	Sanjay K" <sanjay.k.kumar@intel.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Sun, Yi Y" <yi.y.sun@intel.com>, David Woodhouse <dwmw2@infradead.org>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Wed, Sep 25, 2019 at 08:02:23AM +0000, Tian, Kevin wrote:
> > From: Peter Xu [mailto:peterx@redhat.com]
> > Sent: Wednesday, September 25, 2019 3:45 PM
> > 
> > On Wed, Sep 25, 2019 at 07:21:51AM +0000, Tian, Kevin wrote:
> > > > From: Peter Xu [mailto:peterx@redhat.com]
> > > > Sent: Wednesday, September 25, 2019 2:57 PM
> > > >
> > > > On Wed, Sep 25, 2019 at 10:48:32AM +0800, Lu Baolu wrote:
> > > > > Hi Kevin,
> > > > >
> > > > > On 9/24/19 3:00 PM, Tian, Kevin wrote:
> > > > > > > > >       '-----------'
> > > > > > > > >       '-----------'
> > > > > > > > >
> > > > > > > > > This patch series only aims to achieve the first goal, a.k.a using
> > > > > > first goal? then what are other goals? I didn't spot such information.
> > > > > >
> > > > >
> > > > > The overall goal is to use IOMMU nested mode to avoid shadow page
> > > > table
> > > > > and VMEXIT when map an gIOVA. This includes below 4 steps (maybe
> > not
> > > > > accurate, but you could get the point.)
> > > > >
> > > > > 1) GIOVA mappings over 1st-level page table;
> > > > > 2) binding vIOMMU 1st level page table to the pIOMMU;
> > > > > 3) using pIOMMU second level for GPA->HPA translation;
> > > > > 4) enable nested (a.k.a. dual stage) translation in host.
> > > > >
> > > > > This patch set aims to achieve 1).
> > > >
> > > > Would it make sense to use 1st level even for bare-metal to replace
> > > > the 2nd level?
> > > >
> > > > What I'm thinking is the DPDK apps - they have MMU page table already
> > > > there for the huge pages, then if they can use 1st level as the
> > > > default device page table then it even does not need to map, because
> > > > it can simply bind the process root page table pointer to the 1st
> > > > level page root pointer of the device contexts that it uses.
> > > >
> > >
> > > Then you need bear with possible page faults from using CPU page
> > > table, while most devices don't support it today.
> > 
> > Right, I was just thinking aloud.  After all neither do we have IOMMU
> > hardware to support 1st level (or am I wrong?)...  It's just that when
> 
> You are right. Current VT-d supports only 2nd level.
> 
> > the 1st level is ready it should sound doable because IIUC PRI should
> > be always with the 1st level support no matter on IOMMU side or the
> > device side?
> 
> No. PRI is not tied to 1st or 2nd level. Actually from device p.o.v, it's
> just a protocol to trigger page fault, but the device doesn't care whether
> the page fault is on 1st or 2nd level in the IOMMU side. The only
> relevant part is that a PRI request can have PASID tagged or cleared.
> When it's tagged with PASID, the IOMMU will locate the translation
> table under the given PASID (either 1st or 2nd level is fine, according
> to PASID entry setting). When no PASID is included, the IOMMU locates
> the translation from default entry (e.g. PASID#0 or any PASID contained
> in RID2PASID in VT-d).
> 
> Your knowledge happened to be correct in deprecated ECS mode. At
> that time, there is only one 2nd level per context entry which doesn't
> support page fault, and there is only one 1st level per PASID entry which
> supports page fault. Then PRI could be indirectly connected to 1st level,
> but this just changed with new scalable mode.
> 
> Another note is that the PRI capability only indicates that a device is
> capable of handling page faults, but not that a device can tolerate
> page fault for any of its DMA access. If the latter is fasle, using CPU 
> page table for DPDK usage is still risky (and specific to device behavior)
> 
> > 
> > I'm actually not sure about whether my understanding here is
> > correct... I thought the pasid binding previously was only for some
> > vendor kernel drivers but not a general thing to userspace.  I feel
> > like that should be doable in the future once we've got some new
> > syscall interface ready to deliver 1st level page table (e.g., via
> > vfio?) then applications like DPDK seems to be able to use that too
> > even directly via bare metal.
> > 
> 
> using 1st level for userspace is different from supporting DMA page
> fault in userspace. The former is purely about which structure to
> keep the mapping. I think we may do the same thing for both bare
> metal and guest (using 2nd level only for GPA when nested is enabled
> on the IOMMU). But reusing CPU page table for userspace is more
> tricky. :-)

Yes I should have mixed up the 1st level page table and PRI a bit, and
after all my initial question should be irrelevant to this series as
well so it's already a bit out of topic (sorry for that).

And, thanks for explaining these. :)

-- 
Peter Xu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
