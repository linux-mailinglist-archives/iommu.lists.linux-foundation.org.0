Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D183424C912
	for <lists.iommu@lfdr.de>; Fri, 21 Aug 2020 02:18:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1E4448854F;
	Fri, 21 Aug 2020 00:18:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P98UUq897oXS; Fri, 21 Aug 2020 00:18:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A2000885E4;
	Fri, 21 Aug 2020 00:18:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8176CC0051;
	Fri, 21 Aug 2020 00:18:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1E208C0051
 for <iommu@lists.linux-foundation.org>; Fri, 21 Aug 2020 00:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1626788572
 for <iommu@lists.linux-foundation.org>; Fri, 21 Aug 2020 00:18:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OHac8+kzNfdg for <iommu@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 00:18:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0F5F38856C
 for <iommu@lists.linux-foundation.org>; Fri, 21 Aug 2020 00:18:47 +0000 (UTC)
IronPort-SDR: unZYvU4r04UWfpbnjrX2QBU00hy6AYsv8rmP8M6UKuffQESgZFTMO+SXEEun/0oT/jAWUAQ/80
 MOe5x6zUxTgw==
X-IronPort-AV: E=McAfee;i="6000,8403,9719"; a="173472387"
X-IronPort-AV: E=Sophos;i="5.76,335,1592895600"; d="scan'208";a="173472387"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2020 17:18:46 -0700
IronPort-SDR: O9LITwcWdXQ96zpTbFGHeYuEdvW8NukP5z1g5wAwRh7FJFSc/YrTf/3yORIPuk6fl7+Cj6yu2K
 a1kgHrl7ZMAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,335,1592895600"; d="scan'208";a="293661736"
Received: from orsmsx602-2.jf.intel.com (HELO ORSMSX602.amr.corp.intel.com)
 ([10.22.229.82])
 by orsmga003.jf.intel.com with ESMTP; 20 Aug 2020 17:18:46 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 20 Aug 2020 17:18:45 -0700
Received: from ORSEDG001.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 20 Aug 2020 17:18:45 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 20 Aug 2020 17:18:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UGqaSQ5l1MFl6KvUwPDvFVfVYKKBMcHaorAZJX2y8tkM9s9zIoaQBUqWXufyNvizqg+ccu0ub4LKr60kEUt9I1pzmwKGRtHyB7LmynVONl5Z3AHWe81hfnlE9zMrfpU6GEPD2GQKIh0q1Vj6996LSAUnGKB5nuuJaTKMfEU4QTbz/wVA9FhoJ6d+y45Az1jtVVIYoerkE/PITiTCz/fcklokQQjvqpXKmHEjn9hyI6KfnzozylKVdVTQiYdPpIcvmFtwTW8D8q75E5bDS890VtIsXDEIxtceWkvvfp9qX86/bZPzpYWMsZpDKZrR+BFxJOVdJtfpBUtazxiHVBFszg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r5bIVe6gcpFPWpncyt1q/YSFac8bALY1jUzxd6/TB3I=;
 b=WQ/I/Bk1/b4AtRH38oZYxl3Rk4o9ataReK2sDZAjoSlH9092jqN2bBqt1fHwxPHilHhvSS1BjOu0jGv38/MoOgA6UiWQBCpROO9MffZtJzckVOIyuwnBnbjZlQzrwmOYoixvPNuWgofuXJjjoMZd5IABObdVhed+eUxn/ErH7ghskrm/f29FXDVPNzLVLMpc3lQscDhLFMIxUwcRH0AFH7gl+P6IrmQ7fJWsidLZq4K2ibcQkNK5VESWXJuUeKc1MZqa3zTwy9ksBOZSlr9g82ifx6B7wIMJE/xQKMYK67PscCv/MGepyD8buAvuDKh7qyyG8kPSN3gcGAOxc+T9TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r5bIVe6gcpFPWpncyt1q/YSFac8bALY1jUzxd6/TB3I=;
 b=Tcq3+qipQpx9/274Q+nrPD/gcQdKRrh/y7X/EtN5fVa/WZFPbd6TrzRx7ekoYVjo3JBirlPj1/jR+CwLyci258Q1HIJekgONnxpBCjD0vEm5ogPKaQB01nxeWI9+Tgr01qXwu27XsvtFdnK02gwAoxcC6GRqFagQwMFsObgnJTA=
Received: from DM5PR11MB1435.namprd11.prod.outlook.com (2603:10b6:4:7::18) by
 DM5PR11MB1996.namprd11.prod.outlook.com (2603:10b6:3:13::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24; Fri, 21 Aug 2020 00:18:40 +0000
Received: from DM5PR11MB1435.namprd11.prod.outlook.com
 ([fe80::9002:97a2:d8c0:8364]) by DM5PR11MB1435.namprd11.prod.outlook.com
 ([fe80::9002:97a2:d8c0:8364%10]) with mapi id 15.20.3305.024; Fri, 21 Aug
 2020 00:18:40 +0000
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: RE: [PATCH v6 08/15] iommu: Pass domain to sva_unbind_gpasid()
Thread-Topic: [PATCH v6 08/15] iommu: Pass domain to sva_unbind_gpasid()
Thread-Index: AQHWZKdHkDkp+TICJUKhMIrZK5frL6lBojGAgAA0iIA=
Date: Fri, 21 Aug 2020 00:18:40 +0000
Message-ID: <DM5PR11MB1435D6293872F0EF38B9A0FBC35B0@DM5PR11MB1435.namprd11.prod.outlook.com>
References: <1595917664-33276-1-git-send-email-yi.l.liu@intel.com>
 <1595917664-33276-9-git-send-email-yi.l.liu@intel.com>
 <20200820150619.5dc1ec7a@x1.home>
In-Reply-To: <20200820150619.5dc1ec7a@x1.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [117.169.229.112]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c59e6e1a-9fb9-4368-a35b-08d84567c1df
x-ms-traffictypediagnostic: DM5PR11MB1996:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB19967E639151B38896A5357AC35B0@DM5PR11MB1996.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:211;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9XQM62T04BcdaHEYnwKkPtMtxEN09Zxj+IQQHEG3K+CYu1E+6YX/V9p30NaHDeTXW00978o/6rFryCuNGlL7cs0yBHWhYrT3o/ArlHIOYLMHSMyyDhrJyZ5tKUZ6cmi7kvIQqvmp0OScg+39b3YVrPiF2223XL8oGLLIYlq4z/aehD8JAi1h9heYDt/DpuSltFTXTv98Owj+93QdVh5OikHayPlcCicH1rvheJaGwoXNV/IL7PsRPZy7QsWmJ9Jga7ibGCg0lcn1dwX3MkR/FDmPiJXSwDm0Fmw0VI2lsBevQx7jBhPTHk24QSErBIyReexXLveG/D/vyfoP5qNX7sm/1gM+VQIdXyiDzti2lPZALigkNMSxOGAjKU+OwqfeueaIfzEMknhXjpsoXAXfEw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1435.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(376002)(39860400002)(396003)(8676002)(7416002)(9686003)(8936002)(83380400001)(55016002)(54906003)(6916009)(2906002)(6506007)(66556008)(4326008)(316002)(26005)(966005)(66476007)(66946007)(5660300002)(7696005)(64756008)(66446008)(71200400001)(86362001)(186003)(76116006)(33656002)(52536014)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Dh3RHdhJCN1Yxyt/4JM6Y8eCLtClcSg5evk+1PR1QLUcmNdWe5qCyDKFmYaUkjKGoTM6dwpv7VEZf0VMvjXrbimXl5/ET+R0KfIaLr8TBOXT62gft8LzzqIE4k4FtbgVolkGrvjLi08LKG0zCz8/Qqm58gocQN3ygP2OUHEKfci6rXNKpufcyCBCHcOHRjFHW3WcQuOdveOYxIk6g/xEmRumQKOMWFWm8oFc8EJPzMsXvGCJj3taHXutDlC8uD8nIa8g3bQpXfABsPTg4kcrzWOWHmiqvEHruHuZTlvDqvo7bIwZg8Vll6zG7E5ub5yMPeb78bJtgSpHXGH15F4GnZykZy6fvEUJNYp44A97eLJv3iTV3f/ajGXZ0kcyuWq0EQVM34Tn451tUhymJ/d9oNB79UkJRoB83HIqFfpEytJVjobzHoezYpTsHBgR28l0/ewC5Jwu4j8yJ2muukKfuDlmbSLkqx4faU+xF9HdZEqXMQncNUdsl1i6qYBNOuPHuXxgwlbZ2+n6nr7ZIK1+BJ1hepo5QQC1rxt5URnIgAg3s6qdtjzesLvmHgE8eRWKkwsvL/o+iSmX4dkFcoqFsOhB6BKmSMKPJ3uIVCU8v8utcIZdntB4Ha1m29mWWIbabXnhbNUhFMsk7FasH4tLEg==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1435.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c59e6e1a-9fb9-4368-a35b-08d84567c1df
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2020 00:18:40.7583 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F+eXwG+GsGwBuD6W0pvbHAQS+JAK7kDekqh4xRCWNqdC/UTKnUygoiEe6VwtasrxJHS5F55mLFtlKYBwsmJX2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1996
X-OriginatorOrg: intel.com
Cc: "jean-philippe@linaro.org" <jean-philippe@linaro.org>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "stefanha@gmail.com" <stefanha@gmail.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Sun,
 Yi Y" <yi.y.sun@intel.com>, "Wu, Hao" <hao.wu@intel.com>, "Tian,
 Jun J" <jun.j.tian@intel.com>
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

Hi Alex,

> From: Alex Williamson <alex.williamson@redhat.com>
> Sent: Friday, August 21, 2020 5:06 AM
> 
> On Mon, 27 Jul 2020 23:27:37 -0700
> Liu Yi L <yi.l.liu@intel.com> wrote:
> 
> > From: Yi Sun <yi.y.sun@intel.com>
> >
> > Current interface is good enough for SVA virtualization on an assigned
> > physical PCI device, but when it comes to mediated devices, a physical
> > device may attached with multiple aux-domains. Also, for guest unbind,
> 
> s/may/may be/

got it.

> 
> > the PASID to be unbind should be allocated to the VM. This check
> > requires to know the ioasid_set which is associated with the domain.
> >
> > So this interface needs to pass in domain info. Then the iommu driver
> > is able to know which domain will be used for the 2nd stage
> > translation of the nesting mode and also be able to do PASID ownership
> > check. This patch passes @domain per the above reason. Also, the
> > prototype of &pasid is changed frnt" to "u32" as the below link.
> 
> s/frnt"/from an "int"/

got it.

> > https://lore.kernel.org/kvm/27ac7880-bdd3-2891-139e-b4a7cd18420b@redha
> > t.com/
> 
> This is really confusing, the link is to Eric's comment asking that the conversion from
> (at the time) int to ioasid_t be included in the commit log.  The text here implies that
> it's pointing to some sort of justification for the change, which it isn't.  It just notes
> that it happened, not why it happened, with a mostly irrelevant link.

really sorry, a mistake from me. it should be the below link.

[PATCH v6 01/12] iommu: Change type of pasid to u32
https://lore.kernel.org/linux-iommu/1594684087-61184-2-git-send-email-fenghua.yu@intel.com/

> > Cc: Kevin Tian <kevin.tian@intel.com>
> > CC: Jacob Pan <jacob.jun.pan@linux.intel.com>
> > Cc: Alex Williamson <alex.williamson@redhat.com>
> > Cc: Eric Auger <eric.auger@redhat.com>
> > Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > Cc: Joerg Roedel <joro@8bytes.org>
> > Cc: Lu Baolu <baolu.lu@linux.intel.com>
> > Reviewed-by: Eric Auger <eric.auger@redhat.com>
> > Signed-off-by: Yi Sun <yi.y.sun@intel.com>
> > Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
> > ---
> > v5 -> v6:
> > *) use "u32" prototype for @pasid.
> > *) add review-by from Eric Auger.
> 
> I'd probably hold off on adding Eric's R-b given the additional change in this version
> FWIW.  Thanks,

ok, will hold on it. :-)

Regards,
Yi Liu

> Alex
> 
> > v2 -> v3:
> > *) pass in domain info only
> > *) use u32 for pasid instead of int type
> >
> > v1 -> v2:
> > *) added in v2.
> > ---
> >  drivers/iommu/intel/svm.c   | 3 ++-
> >  drivers/iommu/iommu.c       | 2 +-
> >  include/linux/intel-iommu.h | 3 ++-
> >  include/linux/iommu.h       | 3 ++-
> >  4 files changed, 7 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/iommu/intel/svm.c b/drivers/iommu/intel/svm.c
> > index c27d16a..c85b8d5 100644
> > --- a/drivers/iommu/intel/svm.c
> > +++ b/drivers/iommu/intel/svm.c
> > @@ -436,7 +436,8 @@ int intel_svm_bind_gpasid(struct iommu_domain *domain,
> struct device *dev,
> >  	return ret;
> >  }
> >
> > -int intel_svm_unbind_gpasid(struct device *dev, int pasid)
> > +int intel_svm_unbind_gpasid(struct iommu_domain *domain,
> > +			    struct device *dev, u32 pasid)
> >  {
> >  	struct intel_iommu *iommu = intel_svm_device_to_iommu(dev);
> >  	struct intel_svm_dev *sdev;
> > diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c index
> > 1ce2a61..bee79d7 100644
> > --- a/drivers/iommu/iommu.c
> > +++ b/drivers/iommu/iommu.c
> > @@ -2145,7 +2145,7 @@ int iommu_sva_unbind_gpasid(struct iommu_domain
> *domain, struct device *dev,
> >  	if (unlikely(!domain->ops->sva_unbind_gpasid))
> >  		return -ENODEV;
> >
> > -	return domain->ops->sva_unbind_gpasid(dev, data->hpasid);
> > +	return domain->ops->sva_unbind_gpasid(domain, dev, data->hpasid);
> >  }
> >  EXPORT_SYMBOL_GPL(iommu_sva_unbind_gpasid);
> >
> > diff --git a/include/linux/intel-iommu.h b/include/linux/intel-iommu.h
> > index 0d0ab32..f98146b 100644
> > --- a/include/linux/intel-iommu.h
> > +++ b/include/linux/intel-iommu.h
> > @@ -738,7 +738,8 @@ extern int intel_svm_enable_prq(struct intel_iommu
> > *iommu);  extern int intel_svm_finish_prq(struct intel_iommu *iommu);
> > int intel_svm_bind_gpasid(struct iommu_domain *domain, struct device *dev,
> >  			  struct iommu_gpasid_bind_data *data); -int
> > intel_svm_unbind_gpasid(struct device *dev, int pasid);
> > +int intel_svm_unbind_gpasid(struct iommu_domain *domain,
> > +			    struct device *dev, u32 pasid);
> >  struct iommu_sva *intel_svm_bind(struct device *dev, struct mm_struct *mm,
> >  				 void *drvdata);
> >  void intel_svm_unbind(struct iommu_sva *handle); diff --git
> > a/include/linux/iommu.h b/include/linux/iommu.h index b1ff702..80467fc
> > 100644
> > --- a/include/linux/iommu.h
> > +++ b/include/linux/iommu.h
> > @@ -303,7 +303,8 @@ struct iommu_ops {
> >  	int (*sva_bind_gpasid)(struct iommu_domain *domain,
> >  			struct device *dev, struct iommu_gpasid_bind_data *data);
> >
> > -	int (*sva_unbind_gpasid)(struct device *dev, int pasid);
> > +	int (*sva_unbind_gpasid)(struct iommu_domain *domain,
> > +				 struct device *dev, u32 pasid);
> >
> >  	int (*def_domain_type)(struct device *dev);
> >

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
