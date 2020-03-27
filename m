Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 20092195332
	for <lists.iommu@lfdr.de>; Fri, 27 Mar 2020 09:46:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CBCCA888B0;
	Fri, 27 Mar 2020 08:46:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id quG5tRy0vM4Y; Fri, 27 Mar 2020 08:45:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 91BA888847;
	Fri, 27 Mar 2020 08:45:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 68A36C0177;
	Fri, 27 Mar 2020 08:45:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A5F00C0177
 for <iommu@lists.linux-foundation.org>; Fri, 27 Mar 2020 08:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 906AF895CE
 for <iommu@lists.linux-foundation.org>; Fri, 27 Mar 2020 08:45:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AdC8t8Zxjp07 for <iommu@lists.linux-foundation.org>;
 Fri, 27 Mar 2020 08:45:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A059F89557
 for <iommu@lists.linux-foundation.org>; Fri, 27 Mar 2020 08:45:56 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 26so9566807wmk.1
 for <iommu@lists.linux-foundation.org>; Fri, 27 Mar 2020 01:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TNtHMrBw1/kFRLyWRQzpEzTGkiODbvLoqCcIATUetSQ=;
 b=LA9Fq6azF2+zSralszTxVY7JqxhxxsiaZb2AoDbfkRN0R3N0rkQgFTS6aGvtGchHSq
 rGvKFw+0Zf8fHrmkahk4/6T3g1thDq3mnNR/aO4WyAvZYh3EhZOwiAs8p3je9NR8FqeH
 eugcdMHplFlkKr3XiGbHLTK0T3hIfOEt+M/NTlQcdTGw8Rk0VoMHKlmiiWpqbHbPcwXo
 /ZOo3it+BOseqw84us4p+ubVuYX1XIJtpj38y1kZV/AK6AlqlYX+UUjX4wUuMn0B1uTO
 jAxY7u+cIYL8ahbK3hSj8z04XrUqEAxtSPl8sMDrkuj2AVpubAi9PzGk62rHm7z/KdgE
 QErA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TNtHMrBw1/kFRLyWRQzpEzTGkiODbvLoqCcIATUetSQ=;
 b=uUu+m0p1zwDr3yNi5ny0bhBOrwcQ+bgQs+U/O+LTt4s/0pUXVUHitam2zdXDKSjmEr
 LDe05UUPZZ9Gx/7gskKGumogFSdPwxtDcsIyDPfimin1TFo2NbWb2T2djJ/7DEB2QvZh
 85lN5d2q+3tlCqG8abA+DLS2O531mmJBsdRXgkjmX4z63xFbPEyTEV/6NlYc5/Su4PDG
 BsAotcddAMNzDcmELLdkUax3sg7pPYtxJhpyr7aYvppY8YiOtexsLlFmZ+D3nYAd3qkm
 aHsKl2ARAYGvQUhxGhFFv9WRBifvuf/KgVO7KR8h9ZAkWQSGt9PZULIo9H0XHzXErJQH
 UZlg==
X-Gm-Message-State: ANhLgQ1LFl/DprEVXAwDCeIqdaUu+VvAmZt8GqhYQjW7uEBnMAJ+8mGf
 HRoEzP0QnPGcJ9Eqghr+AfVLhA==
X-Google-Smtp-Source: ADFU+vsEaMqgmcJTryYU53r8BbWXb0EA3wBlWHalOBre6t/JUxmyfZ0AnP1+VitjwwucuGEimHxOZQ==
X-Received: by 2002:a1c:4987:: with SMTP id w129mr4498312wma.168.1585298755090; 
 Fri, 27 Mar 2020 01:45:55 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id y187sm7437237wmd.0.2020.03.27.01.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2020 01:45:54 -0700 (PDT)
Date: Fri, 27 Mar 2020 09:45:46 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Hanjun Guo <guohanjun@huawei.com>
Subject: Re: [PATCH v4 02/16] ACPI/IORT: Remove direct access of
 dev->iommu_fwspec
Message-ID: <20200327084546.GA4083132@myrica>
References: <20200326150841.10083-1-joro@8bytes.org>
 <20200326150841.10083-3-joro@8bytes.org>
 <82dea1be-4a2e-e914-c607-8aeb924eb36f@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <82dea1be-4a2e-e914-c607-8aeb924eb36f@huawei.com>
Cc: Joerg Roedel <jroedel@suse.de>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 iommu@lists.linux-foundation.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, Andy Gross <agross@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Paul <sean@poorly.run>, Robin Murphy <robin.murphy@arm.com>
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

On Fri, Mar 27, 2020 at 11:30:53AM +0800, Hanjun Guo wrote:
> On 2020/3/26 23:08, Joerg Roedel wrote:
> > From: Joerg Roedel <jroedel@suse.de>
> > 
> > Use the accessor functions instead of directly dereferencing
> > dev->iommu_fwspec.
> > 
> > Tested-by: Hanjun Guo <guohanjun@huawei.com>
> > Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > Signed-off-by: Joerg Roedel <jroedel@suse.de>
> > ---
> >  drivers/acpi/arm64/iort.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
> > index ed3d2d1a7ae9..7d04424189df 100644
> > --- a/drivers/acpi/arm64/iort.c
> > +++ b/drivers/acpi/arm64/iort.c
> > @@ -1015,6 +1015,7 @@ const struct iommu_ops *iort_iommu_configure(struct device *dev)
> >  		return ops;
> >  
> >  	if (dev_is_pci(dev)) {
> > +		struct iommu_fwspec *fwspec;
> >  		struct pci_bus *bus = to_pci_dev(dev)->bus;
> >  		struct iort_pci_alias_info info = { .dev = dev };
> >  
> > @@ -1027,8 +1028,9 @@ const struct iommu_ops *iort_iommu_configure(struct device *dev)
> >  		err = pci_for_each_dma_alias(to_pci_dev(dev),
> >  					     iort_pci_iommu_init, &info);
> 
> ...
> 
> >  
> > -		if (!err && iort_pci_rc_supports_ats(node))
> > -			dev->iommu_fwspec->flags |= IOMMU_FWSPEC_PCI_RC_ATS;
> > +		fwspec = dev_iommu_fwspec_get(dev);
> > +		if (fwspec && iort_pci_rc_supports_ats(node))
> 
> Should we check !err as well?

No need, the check should have been on fwspec from the beginning. Checking
err was just a lazy shortcut on my part, as we're really just making sure
that we can dereference fwspec->flags here.

Thanks,
Jean

> 
> Thanks
> Hanjun
> 
> > +			fwspec->flags |= IOMMU_FWSPEC_PCI_RC_ATS;
> >  	} else {
> >  		int i = 0;
> >  
> > 
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
