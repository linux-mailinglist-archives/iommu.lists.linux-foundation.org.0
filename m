Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7F3E7C69
	for <lists.iommu@lfdr.de>; Mon, 28 Oct 2019 23:37:25 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5654AE2B;
	Mon, 28 Oct 2019 22:37:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 19B1DAD0
	for <iommu@lists.linux-foundation.org>;
	Mon, 28 Oct 2019 22:37:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7396987C
	for <iommu@lists.linux-foundation.org>;
	Mon, 28 Oct 2019 22:37:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Oct 2019 15:37:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,241,1569308400"; d="scan'208";a="203399122"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
	by orsmga006.jf.intel.com with ESMTP; 28 Oct 2019 15:37:16 -0700
Date: Mon, 28 Oct 2019 15:41:40 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v7 06/11] iommu/vt-d: Avoid duplicated code for PASID setup
Message-ID: <20191028154140.313a1fe9@jacob-builder>
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D5CDCA0@SHSMSX104.ccr.corp.intel.com>
References: <1571946904-86776-1-git-send-email-jacob.jun.pan@linux.intel.com>
	<1571946904-86776-7-git-send-email-jacob.jun.pan@linux.intel.com>
	<AADFC41AFE54684AB9EE6CBC0274A5D19D5CDCA0@SHSMSX104.ccr.corp.intel.com>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Raj, Ashok" <ashok.raj@intel.com>, David Woodhouse <dwmw2@infradead.org>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.com>,
	Jonathan Cameron <jic23@kernel.org>
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

On Fri, 25 Oct 2019 06:42:54 +0000
"Tian, Kevin" <kevin.tian@intel.com> wrote:

> > From: Jacob Pan [mailto:jacob.jun.pan@linux.intel.com]
> > Sent: Friday, October 25, 2019 3:55 AM
> > 
> > After each setup for PASID entry, related translation caches must be
> > flushed.
> > We can combine duplicated code into one function which is less error
> > prone.
> > 
> > Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>  
> 
> similarly, it doesn't need to be in this series.
Technically true, it is in this series so that we can use the combined
function. 
> 
> > ---
> >  drivers/iommu/intel-pasid.c | 48
> > +++++++++++++++++--------------------------- -
> >  1 file changed, 18 insertions(+), 30 deletions(-)
> > 
> > diff --git a/drivers/iommu/intel-pasid.c
> > b/drivers/iommu/intel-pasid.c index e79d680fe300..ffbd416ed3b8
> > 100644 --- a/drivers/iommu/intel-pasid.c
> > +++ b/drivers/iommu/intel-pasid.c
> > @@ -485,6 +485,21 @@ void intel_pasid_tear_down_entry(struct
> > intel_iommu *iommu,
> >  		devtlb_invalidation_with_pasid(iommu, dev, pasid);
> >  }
> > 
> > +static void pasid_flush_caches(struct intel_iommu *iommu,
> > +				struct pasid_entry *pte,
> > +				int pasid, u16 did)
> > +{
> > +	if (!ecap_coherent(iommu->ecap))
> > +		clflush_cache_range(pte, sizeof(*pte));
> > +
> > +	if (cap_caching_mode(iommu->cap)) {
> > +		pasid_cache_invalidation_with_pasid(iommu, did,
> > pasid);
> > +		iotlb_invalidation_with_pasid(iommu, did, pasid);
> > +	} else {
> > +		iommu_flush_write_buffer(iommu);
> > +	}
> > +}
> > +
> >  /*
> >   * Set up the scalable mode pasid table entry for first only
> >   * translation type.
> > @@ -530,16 +545,7 @@ int intel_pasid_setup_first_level(struct
> > intel_iommu *iommu,
> >  	/* Setup Present and PASID Granular Transfer Type: */
> >  	pasid_set_translation_type(pte, 1);
> >  	pasid_set_present(pte);
> > -
> > -	if (!ecap_coherent(iommu->ecap))
> > -		clflush_cache_range(pte, sizeof(*pte));
> > -
> > -	if (cap_caching_mode(iommu->cap)) {
> > -		pasid_cache_invalidation_with_pasid(iommu, did,
> > pasid);
> > -		iotlb_invalidation_with_pasid(iommu, did, pasid);
> > -	} else {
> > -		iommu_flush_write_buffer(iommu);
> > -	}
> > +	pasid_flush_caches(iommu, pte, pasid, did);
> > 
> >  	return 0;
> >  }
> > @@ -603,16 +609,7 @@ int intel_pasid_setup_second_level(struct
> > intel_iommu *iommu,
> >  	 */
> >  	pasid_set_sre(pte);
> >  	pasid_set_present(pte);
> > -
> > -	if (!ecap_coherent(iommu->ecap))
> > -		clflush_cache_range(pte, sizeof(*pte));
> > -
> > -	if (cap_caching_mode(iommu->cap)) {
> > -		pasid_cache_invalidation_with_pasid(iommu, did,
> > pasid);
> > -		iotlb_invalidation_with_pasid(iommu, did, pasid);
> > -	} else {
> > -		iommu_flush_write_buffer(iommu);
> > -	}
> > +	pasid_flush_caches(iommu, pte, pasid, did);
> > 
> >  	return 0;
> >  }
> > @@ -646,16 +643,7 @@ int intel_pasid_setup_pass_through(struct
> > intel_iommu *iommu,
> >  	 */
> >  	pasid_set_sre(pte);
> >  	pasid_set_present(pte);
> > -
> > -	if (!ecap_coherent(iommu->ecap))
> > -		clflush_cache_range(pte, sizeof(*pte));
> > -
> > -	if (cap_caching_mode(iommu->cap)) {
> > -		pasid_cache_invalidation_with_pasid(iommu, did,
> > pasid);
> > -		iotlb_invalidation_with_pasid(iommu, did, pasid);
> > -	} else {
> > -		iommu_flush_write_buffer(iommu);
> > -	}
> > +	pasid_flush_caches(iommu, pte, pasid, did);
> > 
> >  	return 0;
> >  }
> > --
> > 2.7.4  
> 

[Jacob Pan]
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
