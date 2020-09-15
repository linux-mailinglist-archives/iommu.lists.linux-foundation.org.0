Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0769426AB95
	for <lists.iommu@lfdr.de>; Tue, 15 Sep 2020 20:12:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8CC511FDFB;
	Tue, 15 Sep 2020 18:12:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZWmPgalbN0lI; Tue, 15 Sep 2020 18:12:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 449641FF59;
	Tue, 15 Sep 2020 18:12:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 352E7C0051;
	Tue, 15 Sep 2020 18:12:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 751F5C0051
 for <iommu@lists.linux-foundation.org>; Tue, 15 Sep 2020 18:12:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5FDC387048
 for <iommu@lists.linux-foundation.org>; Tue, 15 Sep 2020 18:12:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PpjgUJvLi8G5 for <iommu@lists.linux-foundation.org>;
 Tue, 15 Sep 2020 18:12:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D9D9D86F92
 for <iommu@lists.linux-foundation.org>; Tue, 15 Sep 2020 18:12:10 +0000 (UTC)
IronPort-SDR: SFdVielst0nE5xe19WDies4iGOWopA8vCSd8J9tEv49QljbFGwEl6o1O9EkPJl8qJYLjYeJYzS
 oX9rEE1FmjkA==
X-IronPort-AV: E=McAfee;i="6000,8403,9745"; a="220880212"
X-IronPort-AV: E=Sophos;i="5.76,430,1592895600"; d="scan'208";a="220880212"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2020 11:12:06 -0700
IronPort-SDR: 2yevVxUIuGFyPzj89k9XlKLqqnFeOyatylM4vAZa8uoq5I1vHjwJQ+dbt9lOq5K3P0Qgvog9+S
 su5Dl2Zc8U9Q==
X-IronPort-AV: E=Sophos;i="5.76,430,1592895600"; d="scan'208";a="507676675"
Received: from otc-nc-03.jf.intel.com (HELO otc-nc-03) ([10.54.39.36])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2020 11:12:02 -0700
Date: Tue, 15 Sep 2020 11:11:54 -0700
From: "Raj, Ashok" <ashok.raj@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v7 00/16] vfio: expose virtual Shared Virtual Addressing
 to VMs
Message-ID: <20200915181154.GA70770@otc-nc-03>
References: <20200914133113.GB1375106@myrica>
 <20200914134738.GX904879@nvidia.com>
 <20200914162247.GA63399@otc-nc-03>
 <20200914163354.GG904879@nvidia.com>
 <20200914105857.3f88a271@x1.home>
 <20200914174121.GI904879@nvidia.com>
 <20200914122328.0a262a7b@x1.home>
 <20200914190057.GM904879@nvidia.com>
 <20200914224438.GA65940@otc-nc-03>
 <20200915113341.GW904879@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200915113341.GW904879@nvidia.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: yi.y.sun@intel.com, Jean-Philippe Brucker <jean-philippe@linaro.org>,
 kevin.tian@intel.com, Ashok Raj <ashok.raj@intel.com>, kvm@vger.kernel.org,
 iommu@lists.linux-foundation.org, stefanha@gmail.com,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 jun.j.tian@intel.com, Alex Williamson <alex.williamson@redhat.com>,
 Jacon Jun Pan <jacob.jun.pan@intel.com>, hao.wu@intel.com
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

On Tue, Sep 15, 2020 at 08:33:41AM -0300, Jason Gunthorpe wrote:
> On Mon, Sep 14, 2020 at 03:44:38PM -0700, Raj, Ashok wrote:
> > Hi Jason,
> > 
> > I thought we discussed this at LPC, but still seems to be going in
> > circles :-(.
> 
> We discused mdev at LPC, not PASID.
> 
> PASID applies widely to many device and needs to be introduced with a
> wide community agreement so all scenarios will be supportable.

True, reading some of the earlier replies I was clearly confused as I
thought you were talking about mdev again. But now that you stay it, you
have moved past mdev and its the PASID interfaces correct?

> 
> > As you had suggested earlier in the mail thread could Jason Wang maybe
> > build out what it takes to have a full fledged /dev/sva interface for vDPA
> > and figure out how the interfaces should emerge? otherwise it appears
> > everyone is talking very high level and with that limited understanding of
> > how things work at the moment. 
> 
> You want Jason Wang to do the work to get Intel PASID support merged?
> Seems a bit of strange request.

I was reading mdev in my head. Not PASID, sorry.

For the native user applications have just 1 PASID per process. There is no
need for a quota management. VFIO being the one used for guest where there
is more PASID's per guest is where this is enforced today. 

IIUC, you are asking that part of the interface to move to a API interface
that potentially the new /dev/sva and VFIO could share? I think the API's
for PASID management themselves are generic (Jean's patchset + Jacob's
ioasid set management). 

Possibly what you need is already available, but not in a specific way that
you expect maybe? 

Let me check with Jacob and let him/Jean pick that up.

Cheers,
Ashok

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
