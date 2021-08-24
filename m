Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id D651C3F5A24
	for <lists.iommu@lfdr.de>; Tue, 24 Aug 2021 10:49:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4931360679;
	Tue, 24 Aug 2021 08:49:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HucnYFs7vO4L; Tue, 24 Aug 2021 08:49:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 51FF4605E0;
	Tue, 24 Aug 2021 08:49:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 34E33C001F;
	Tue, 24 Aug 2021 08:49:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 199B5C000E
 for <iommu@lists.linux-foundation.org>; Tue, 24 Aug 2021 08:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F31584013F
 for <iommu@lists.linux-foundation.org>; Tue, 24 Aug 2021 08:49:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZcZEOAHUXZ8e for <iommu@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 08:49:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE89E400A8
 for <iommu@lists.linux-foundation.org>; Tue, 24 Aug 2021 08:49:40 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6100567373; Tue, 24 Aug 2021 10:49:35 +0200 (CEST)
Date: Tue, 24 Aug 2021 10:49:34 +0200
From: "hch@lst.de" <hch@lst.de>
To: Michael Kelley <mikelley@microsoft.com>
Subject: min_align_mask Re: [PATCH V3 13/13] HV/Storvsc: Add Isolation VM
 support for storvsc driver
Message-ID: <20210824084934.GC29844@lst.de>
References: <20210809175620.720923-1-ltykernel@gmail.com>
 <20210809175620.720923-14-ltykernel@gmail.com>
 <MWHPR21MB1593EEF30FFD5C60ED744985D7C09@MWHPR21MB1593.namprd21.prod.outlook.com>
 <20210820043237.GC26450@lst.de>
 <CY4PR21MB1586FEB6F6ADD592C04E541BD7C19@CY4PR21MB1586.namprd21.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CY4PR21MB1586FEB6F6ADD592C04E541BD7C19@CY4PR21MB1586.namprd21.prod.outlook.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: "parri.andrea@gmail.com" <parri.andrea@gmail.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "brijesh.singh@amd.com" <brijesh.singh@amd.com>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 mpi3mr-linuxdrv.pdl@broadcom.com, vkuznets <vkuznets@redhat.com>,
 "hpa@zytor.com" <hpa@zytor.com>, KY Srinivasan <kys@microsoft.com>,
 "will@kernel.org" <will@kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 linux-rdma@vger.kernel.org,
 "aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>,
 "x86@kernel.org" <x86@kernel.org>, Dexuan Cui <decui@microsoft.com>,
 Tianyu Lan <ltykernel@gmail.com>, "hch@lst.de" <hch@lst.de>,
 "mingo@redhat.com" <mingo@redhat.com>, "pgonda@google.com" <pgonda@google.com>,
 "rientjes@google.com" <rientjes@google.com>,
 "kuba@kernel.org" <kuba@kernel.org>, "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "martin.b.radev@gmail.com" <martin.b.radev@gmail.com>,
 "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
 Tianyu Lan <Tianyu.Lan@microsoft.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, "bp@alien8.de" <bp@alien8.de>,
 "luto@kernel.org" <luto@kernel.org>,
 "krish.sadhukhan@oracle.com" <krish.sadhukhan@oracle.com>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "jgross@suse.com" <jgross@suse.com>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "saravanand@fb.com" <saravanand@fb.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "dave.hansen@intel.com" <dave.hansen@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "rppt@kernel.org" <rppt@kernel.org>, "hannes@cmpxchg.org" <hannes@cmpxchg.org>,
 "tj@kernel.org" <tj@kernel.org>, "ardb@kernel.org" <ardb@kernel.org>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>
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

On Fri, Aug 20, 2021 at 03:40:08PM +0000, Michael Kelley wrote:
> I see that the swiotlb code gets and uses the min_align_mask field.  But
> the NVME driver is the only driver that ever sets it, so the value is zero
> in all other cases.  Does swiotlb just use PAGE_SIZE in that that case?  I
> couldn't tell from a quick glance at the swiotlb code.

The encoding isn't all that common.  I only know it for the RDMA memory
registration format, and RDMA in general does not interact very well
with swiotlb (although the in-kernel drivers should work fine, it is
userspace RDMA that is the problem).  It seems recently a new driver
using the format (mpi3mr) also showed up.  All these should probably set
the min_align_mask.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
