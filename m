Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBB3BD89C
	for <lists.iommu@lfdr.de>; Wed, 25 Sep 2019 08:57:07 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0A23CBDC;
	Wed, 25 Sep 2019 06:57:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CBE3D9CA
	for <iommu@lists.linux-foundation.org>;
	Wed, 25 Sep 2019 06:57:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 746C08B2
	for <iommu@lists.linux-foundation.org>;
	Wed, 25 Sep 2019 06:56:54 +0000 (UTC)
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
	[209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 02754C059758
	for <iommu@lists.linux-foundation.org>;
	Wed, 25 Sep 2019 06:56:54 +0000 (UTC)
Received: by mail-pf1-f199.google.com with SMTP id v6so3305504pfm.1
	for <iommu@lists.linux-foundation.org>;
	Tue, 24 Sep 2019 23:56:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ijT0fpBaBgG6WmvEUpSA+esMu5WxoRviWQWfgADFoo4=;
	b=RPaFqySiyYq9viNW+xu5fyp+EiTHGFE4dOLPRZPABR7lWCxj44DhLFh0ArbIffQ1rV
	lnhPMGOcLyKz4/C2uD+EspCOwsNkOir/HfmHHlG21KOXZ082Hy75vVMRJ2Ah3EdFdFPJ
	BzFL0dY6nnZFqWqoUh3ThICjV3DL8EOH4I4XrI07cW0N5VQ4w/DtxoHmTfI7lwl+sGqQ
	l8GeOFQxIBnRSHQK0Q7abfi/Amh1Nqcuagn9Kzf0cgC02aOFqmK5WTZ6YlagaCIp+6OX
	M3EQPzFx/WrekaW+BRpdw65hwNyI55Hnbg1bwHe8j1YBzmGXo27w+CD2evc7ShcaPtBx
	gZIA==
X-Gm-Message-State: APjAAAV5irullYoIQNlNYQ+pBi8ge+aPR0OMDzhYnlTf8Rfa/OQBktDa
	y0XwLPm1cFjOIxwcZbiHyBq4+KMeb7anDyUC/OYw+CkbASw+uBZ9vy3c6+B4u0zaOg6OJjq9NiR
	if+DQ5XhYKcQwfZv+0PRStI8+ymyDUA==
X-Received: by 2002:aa7:91d4:: with SMTP id z20mr8178146pfa.131.1569394613574; 
	Tue, 24 Sep 2019 23:56:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyEQscMvlt2r5p9VzQw9b3ybPcThukuDsFI9KDVwsVjgxUw63WdPiTX25gqJqaKL+BCyIqXjg==
X-Received: by 2002:aa7:91d4:: with SMTP id z20mr8178134pfa.131.1569394613417; 
	Tue, 24 Sep 2019 23:56:53 -0700 (PDT)
Received: from xz-x1 ([209.132.188.80]) by smtp.gmail.com with ESMTPSA id
	g24sm6184543pgn.90.2019.09.24.23.56.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 24 Sep 2019 23:56:52 -0700 (PDT)
Date: Wed, 25 Sep 2019 14:56:40 +0800
From: Peter Xu <peterx@redhat.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [RFC PATCH 0/4] Use 1st-level for DMA remapping in guest
Message-ID: <20190925065640.GO28074@xz-x1>
References: <20190923122454.9888-1-baolu.lu@linux.intel.com>
	<20190923122715.53de79d0@jacob-builder>
	<20190923202552.GA21816@araj-mobl1.jf.intel.com>
	<AADFC41AFE54684AB9EE6CBC0274A5D19D58D1F1@SHSMSX104.ccr.corp.intel.com>
	<dfd9b7a2-5553-328a-08eb-16c8a3a2644e@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dfd9b7a2-5553-328a-08eb-16c8a3a2644e@linux.intel.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
	Alex Williamson <alex.williamson@redhat.com>, "Raj,
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

On Wed, Sep 25, 2019 at 10:48:32AM +0800, Lu Baolu wrote:
> Hi Kevin,
> 
> On 9/24/19 3:00 PM, Tian, Kevin wrote:
> > > > >       '-----------'
> > > > >       '-----------'
> > > > > 
> > > > > This patch series only aims to achieve the first goal, a.k.a using
> > first goal? then what are other goals? I didn't spot such information.
> > 
> 
> The overall goal is to use IOMMU nested mode to avoid shadow page table
> and VMEXIT when map an gIOVA. This includes below 4 steps (maybe not
> accurate, but you could get the point.)
> 
> 1) GIOVA mappings over 1st-level page table;
> 2) binding vIOMMU 1st level page table to the pIOMMU;
> 3) using pIOMMU second level for GPA->HPA translation;
> 4) enable nested (a.k.a. dual stage) translation in host.
> 
> This patch set aims to achieve 1).

Would it make sense to use 1st level even for bare-metal to replace
the 2nd level?

What I'm thinking is the DPDK apps - they have MMU page table already
there for the huge pages, then if they can use 1st level as the
default device page table then it even does not need to map, because
it can simply bind the process root page table pointer to the 1st
level page root pointer of the device contexts that it uses.

Regards,

-- 
Peter Xu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
