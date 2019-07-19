Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D176E7EC
	for <lists.iommu@lfdr.de>; Fri, 19 Jul 2019 17:23:29 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8F655282F;
	Fri, 19 Jul 2019 15:23:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 57E652648
	for <iommu@lists.linux-foundation.org>;
	Fri, 19 Jul 2019 15:23:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 093D112E
	for <iommu@lists.linux-foundation.org>;
	Fri, 19 Jul 2019 15:23:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 77B7F30C1353;
	Fri, 19 Jul 2019 15:23:05 +0000 (UTC)
Received: from x1.home (ovpn-116-35.phx2.redhat.com [10.3.116.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 833C8101E253;
	Fri, 19 Jul 2019 15:23:04 +0000 (UTC)
Date: Fri, 19 Jul 2019 09:23:03 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v4 12/15] iommu/vt-d: Cleanup get_valid_domain_for_dev()
Message-ID: <20190719092303.751659a0@x1.home>
In-Reply-To: <9957afdd-4075-e7ee-e1e6-97acb870e17a@linux.intel.com>
References: <20190525054136.27810-1-baolu.lu@linux.intel.com>
	<20190525054136.27810-13-baolu.lu@linux.intel.com>
	<20190717211226.5ffbf524@x1.home>
	<9957afdd-4075-e7ee-e1e6-97acb870e17a@linux.intel.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Fri, 19 Jul 2019 15:23:05 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kevin.tian@intel.com, ashok.raj@intel.com, dima@arista.com,
	tmurphy@arista.com, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, jacob.jun.pan@intel.com,
	David Woodhouse <dwmw2@infradead.org>
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

On Fri, 19 Jul 2019 17:04:26 +0800
Lu Baolu <baolu.lu@linux.intel.com> wrote:

> Hi Alex,
> 
> On 7/18/19 11:12 AM, Alex Williamson wrote:
> > On Sat, 25 May 2019 13:41:33 +0800
> > Lu Baolu <baolu.lu@linux.intel.com> wrote:
> >   
> >> Previously, get_valid_domain_for_dev() is used to retrieve the
> >> DMA domain which has been attached to the device or allocate one
> >> if no domain has been attached yet. As we have delegated the DMA
> >> domain management to upper layer, this function is used purely to
> >> allocate a private DMA domain if the default domain doesn't work
> >> for ths device. Cleanup the code for readability.
> >>
> >> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> >> ---
> >>   drivers/iommu/intel-iommu.c | 18 ++++++++----------
> >>   include/linux/intel-iommu.h |  1 -
> >>   2 files changed, 8 insertions(+), 11 deletions(-)  
> > 
> > System fails to boot bisected to this commit:  
> 
> Is this the same issue as this https://lkml.org/lkml/2019/7/18/840?

Yes, the above link is after bisecting with all the bugs and fixes
squashed together to avoid landing in local bugs.  Thanks,

Alex
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
