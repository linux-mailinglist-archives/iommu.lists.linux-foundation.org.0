Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8853AC56A
	for <lists.iommu@lfdr.de>; Fri, 18 Jun 2021 09:54:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 744C683ABB;
	Fri, 18 Jun 2021 07:54:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B_R3Y7MS1okr; Fri, 18 Jun 2021 07:54:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 59E44839D8;
	Fri, 18 Jun 2021 07:54:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E3008C0022;
	Fri, 18 Jun 2021 07:54:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 814DBC000B
 for <iommu@lists.linux-foundation.org>; Fri, 18 Jun 2021 07:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EE19839D8
 for <iommu@lists.linux-foundation.org>; Fri, 18 Jun 2021 07:54:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pnvTYvmM15qt for <iommu@lists.linux-foundation.org>;
 Fri, 18 Jun 2021 07:54:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A2E0C836FE
 for <iommu@lists.linux-foundation.org>; Fri, 18 Jun 2021 07:54:49 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id n20so7365595edv.8
 for <iommu@lists.linux-foundation.org>; Fri, 18 Jun 2021 00:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=o2WQZjhwoaHMxBb+srOde8YwelPLzLRldEZbtvlgRGU=;
 b=k1T0ECGGh1W0dhEm5YpW3R4tr4w2ouXUmoAkc4fnu+nm3wfGl1D/XzfrjxPVvNpD9R
 GUN87sw+XheVvqk6OE0++OuYZdogI1z1/Z+Lp7EcaWueCIl0eiIDcgBLTpL+k3ODqRRi
 o1irouPqfd1Q1/YN2nVPDXvXxcg204pgHRGlmEY1D6DM1HPSCvgbILp/o8l/Wvkr0Iw3
 rGuOE9LxvMTkCXpX5w0+1LTUHt3sZIF4mC2s2Skw8CTsGlTa12/M8ao345z4GdUAlnPd
 JDFt5F5xmanD8rpTrdfn3E8eDxfl207dVuGecnb6ZmTyEXAW4IxIunr2hSUFxui1Sf+u
 +S/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=o2WQZjhwoaHMxBb+srOde8YwelPLzLRldEZbtvlgRGU=;
 b=A6Lu1j61KE3f5ScIGegQEVeOw1koTaYrph1vkMrW3vOJsnaH760eF/H2vML9AwYFk+
 dv/8prVXesQ+x67/PESpXDG6dm3DrhdMgMEHGE36sRxFceVBNDWIHybouyYcfqsuR0ck
 W1byGENnaJRZ+Xb8fW2JjlekdiiOsX/NJpkx+vQ69tpMBPR+KfqfafL17omRt1IEkoaU
 i3rJP4nVRfIQRiW0czYH8cZCafSLMvrw25r4lcWFLnYyh3rBEhT/zzTb7Nm8EIwPOijQ
 maEfItAUjEUnYjV5Xd4K1bwDY0PLpmObJIdxlvxsPdOU6YWnrXLH104htQuh2vMqHG9E
 0UDw==
X-Gm-Message-State: AOAM533Z77NjN/60iHgEuSTBIpMUfBOKeFTnnZlvdHJcWM4IYKz+U7MN
 4X3rZsQnFjEYckYQAxvucxe2Iw==
X-Google-Smtp-Source: ABdhPJw47GTVGsZ2XZZsLWgVTPMHWXGLZ9JfMKbH6mO4cozlyWGnWGY9YGBYGbYr6USC4QNEMkKYww==
X-Received: by 2002:a05:6402:4395:: with SMTP id
 o21mr3261040edc.163.1624002887797; 
 Fri, 18 Jun 2021 00:54:47 -0700 (PDT)
Received: from myrica (adsl-84-226-111-173.adslplus.ch. [84.226.111.173])
 by smtp.gmail.com with ESMTPSA id j22sm680988eje.123.2021.06.18.00.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 00:54:47 -0700 (PDT)
Date: Fri, 18 Jun 2021 09:54:28 +0200
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v4 3/6] ACPI: Add driver for the VIOT table
Message-ID: <YMxRNHVjKk3H6r7t@myrica>
References: <20210610075130.67517-1-jean-philippe@linaro.org>
 <20210610075130.67517-4-jean-philippe@linaro.org>
 <CAJZ5v0gTZDyEC7MuBEv2gg6Usq+PD-WEQJbiAqKrFC3KV-M52g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0gTZDyEC7MuBEv2gg6Usq+PD-WEQJbiAqKrFC3KV-M52g@mail.gmail.com>
Cc: kevin.tian@intel.com, "Michael S. Tsirkin" <mst@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Robin Murphy <robin.murphy@arm.com>,
 virtualization@lists.linux-foundation.org,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 "open list:AMD IOMMU \(AMD-VI\)" <iommu@lists.linux-foundation.org>,
 sebastien.boeuf@intel.com, Hanjun Guo <guohanjun@huawei.com>,
 Will Deacon <will@kernel.org>, David Woodhouse <dwmw2@infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Len Brown <lenb@kernel.org>
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

On Thu, Jun 17, 2021 at 01:50:59PM +0200, Rafael J. Wysocki wrote:
> > diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
> > index be7da23fad76..b835ca702ff0 100644
> > --- a/drivers/acpi/bus.c
> > +++ b/drivers/acpi/bus.c
> > @@ -27,6 +27,7 @@
> >  #include <linux/dmi.h>
> >  #endif
> >  #include <linux/acpi_iort.h>
> > +#include <linux/acpi_viot.h>
> >  #include <linux/pci.h>
> >  #include <acpi/apei.h>
> >  #include <linux/suspend.h>
> > @@ -1339,6 +1340,7 @@ static int __init acpi_init(void)
> >         pci_mmcfg_late_init();
> >         acpi_iort_init();
> >         acpi_scan_init();
> > +       acpi_viot_init();
> 
> Is there a specific reason why to call it right here?
> 
> In particular, does it need to be called after acpi_scan_init()?  And
> does it need to be called before the subsequent functions?  If so,
> then why?

It does need to be called after acpi_scan_init(), because it relies on
struct device and their fwnode to be initialized. In particular to find a
PCI device we call pci_get_domain_bus_and_slot(), which needs the PCI
topology made available by acpi_scan_init().

It does not need to be before the subsequent functions however, I can move
it at the end.

> > +void __init acpi_viot_init(void)
> > +{
> > +       int i;
> > +       acpi_status status;
> > +       struct acpi_table_header *hdr;
> > +       struct acpi_viot_header *node;
> > +
> > +       status = acpi_get_table(ACPI_SIG_VIOT, 0, &hdr);
> > +       if (ACPI_FAILURE(status)) {
> > +               if (status != AE_NOT_FOUND) {
> > +                       const char *msg = acpi_format_exception(status);
> > +
> > +                       pr_err("Failed to get table, %s\n", msg);
> > +               }
> > +               return;
> > +       }
> > +
> > +       viot = (void *)hdr;
> > +
> > +       node = ACPI_ADD_PTR(struct acpi_viot_header, viot, viot->node_offset);
> > +       for (i = 0; i < viot->node_count; i++) {
> > +               if (viot_parse_node(node))
> > +                       return;
> > +
> > +               node = ACPI_ADD_PTR(struct acpi_viot_header, node,
> > +                                   node->length);
> > +       }
> 
> Do you still need the table after the above is complete?  If not,
> release the reference on it acquired above.

We don't need the table anymore, I'll drop the reference

Thanks,
Jean

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
