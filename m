Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B49F72A9BFB
	for <lists.iommu@lfdr.de>; Fri,  6 Nov 2020 19:24:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5997F86A9E;
	Fri,  6 Nov 2020 18:24:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QYJvmvim2JVA; Fri,  6 Nov 2020 18:24:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E74FA85C5E;
	Fri,  6 Nov 2020 18:24:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CC640C0889;
	Fri,  6 Nov 2020 18:24:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2010DC0889
 for <iommu@lists.linux-foundation.org>; Fri,  6 Nov 2020 18:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1807B2E11D
 for <iommu@lists.linux-foundation.org>; Fri,  6 Nov 2020 18:24:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sVO5DwbRktz4 for <iommu@lists.linux-foundation.org>;
 Fri,  6 Nov 2020 18:24:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by silver.osuosl.org (Postfix) with ESMTPS id 8B71920334
 for <iommu@lists.linux-foundation.org>; Fri,  6 Nov 2020 18:24:29 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 9DA7368B02; Fri,  6 Nov 2020 19:24:24 +0100 (CET)
Date: Fri, 6 Nov 2020 19:24:24 +0100
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH v3] swiotlb: Adjust SWIOTBL bounce buffer size for SEV
 guests.
Message-ID: <20201106182424.GA9330@lst.de>
References: <20201104220804.21026-1-Ashish.Kalra@amd.com>
 <20201104221452.GA26079@char.us.oracle.com>
 <20201104223913.GA25311@ashkalra_ubuntu_server>
 <20201105174317.GA4294@char.us.oracle.com>
 <20201105184115.GA25261@ashkalra_ubuntu_server>
 <20201105190649.GB5366@char.us.oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105190649.GB5366@char.us.oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Thomas.Lendacky@amd.com, Ashish Kalra <ashish.kalra@amd.com>,
 brijesh.singh@amd.com, ssg.sos.patches@amd.com, dave.hansen@linux-intel.com,
 peterz@infradead.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, mingo@redhat.com, bp@alien8.de,
 luto@kernel.org, hpa@zytor.com, tglx@linutronix.de, hch@lst.de
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

On Thu, Nov 05, 2020 at 02:06:49PM -0500, Konrad Rzeszutek Wilk wrote:
> .
> > > Right, so I am wondering if we can do this better.
> > > 
> > > That is you are never going to get any 32-bit devices with SEV right? That
> > > is there is nothing that bounds you to always use the memory below 4GB?
> > > 
> > 
> > We do support 32-bit PCIe passthrough devices with SEV.
> 
> Ewww..  Which devices would this be?

There is still some new broken shit like that that keeps appearing.
GPU is pretty famouts for supporting less than 64-bit addressing,
even if it isn't all the way down to 32-bit.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
