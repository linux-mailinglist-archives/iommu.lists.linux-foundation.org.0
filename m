Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 609F4560A21
	for <lists.iommu@lfdr.de>; Wed, 29 Jun 2022 21:15:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 774464198C;
	Wed, 29 Jun 2022 19:15:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 774464198C
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PpnhDeUu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zXRM5K03NV1i; Wed, 29 Jun 2022 19:15:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 05DD44188D;
	Wed, 29 Jun 2022 19:15:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05DD44188D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D6FD9C0036;
	Wed, 29 Jun 2022 19:15:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5006DC0011
 for <iommu@lists.linux-foundation.org>; Wed, 29 Jun 2022 19:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C38E4188D
 for <iommu@lists.linux-foundation.org>; Wed, 29 Jun 2022 19:15:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C38E4188D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bmz24lvl3dwi for <iommu@lists.linux-foundation.org>;
 Wed, 29 Jun 2022 19:15:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9B8941504
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B9B8941504
 for <iommu@lists.linux-foundation.org>; Wed, 29 Jun 2022 19:15:25 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id q9so23906213wrd.8
 for <iommu@lists.linux-foundation.org>; Wed, 29 Jun 2022 12:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=QDVDv5ON0BAYjfNDlZsK6wYaSg+H5s61kzv7l/vdIy0=;
 b=PpnhDeUukAyhD8rnUye13ZPxwiu+Oswze9+LqxoOyZ7FlMJHSHiEPoQq8ksfpGvO8d
 I0tsfja49ZQ83RpEh8p8pz2ZG9RzVEhm4NSY3u4RHLOcyFVB9LGz9aMcPqcvdmSEJDQu
 VTgVB0+NwRtQlf6Flv2B+FWuHH4HiLh7Znmnv6uZKV59i7Td/Bixsmi/gOiFc8pAc2fk
 rWIRhpaJJKmrBACMsO8EnQgSbXJ8+YMONI4dANCN/fPtRJkOTGg3v9DAwlry1rXP5YEH
 NeOkX8B/M0DwA+sRI4CtROBnrb9fjWoWqA2P/c4rdOymKHPCfOsqy+s7lDIoif45jOeg
 hJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QDVDv5ON0BAYjfNDlZsK6wYaSg+H5s61kzv7l/vdIy0=;
 b=hRrzeD3p0Ko5sWcOEG8LTWh9EnKsVg2fgbCAhBBgDoTSCY/EHe2OjvgAs2am3noJIg
 lXZM7iXHVoaIntkD5upYnWE+iLbmqUITxVOf0/+eWy91B6022QS3u4npN+41MZGTbQx1
 JgjxWwEUIoiRECuIAhFOOlUKtDimjCkKRSgZUNWKG4n963ec9oEZDKUNaB1AakiznPeq
 oD3taRhSSdId2xUB8BtZ/DEHa7v7biE9BRNdXaoib/4RcISUvhCBGvksXhcrekvK/k64
 nFO8nWJV7b1h1gybSQiOKvoi2XH06IGFsTs3daMC4QccIGYHiauM+Znsjn6g45Do07GF
 RZvg==
X-Gm-Message-State: AJIora/tYSSiyj/SkNx3NDkPMBSY0WRMLl61ZHQXPoulvQ1zLZfJhw+2
 xeP7UTKeES/QGAj9xa0sp6E=
X-Google-Smtp-Source: AGRyM1sSZ4x6MUSrqrVMuLIcli30IU+QUFZEsAE3fl4Es1rqa14rtQFbO3ota/6pLd0nXXIrOHxR9w==
X-Received: by 2002:adf:f245:0:b0:21b:c705:8b1 with SMTP id
 b5-20020adff245000000b0021bc70508b1mr4600636wrp.282.1656530123696; 
 Wed, 29 Jun 2022 12:15:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 e2-20020adfdbc2000000b0021b9f126fd3sm17770742wrj.14.2022.06.29.12.15.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jun 2022 12:15:23 -0700 (PDT)
Message-ID: <243b32ba-b338-a3a9-cf78-5e668b7a6d19@gmail.com>
Date: Wed, 29 Jun 2022 21:15:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] ACPI: VIOT: Fix ACS setup
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Eric Auger <eric.auger@redhat.com>
References: <20220627125534.1035912-1-eric.auger@redhat.com>
 <YrwX2U48HOC+UF07@myrica>
From: Eric Auger <eric.auger.pro@gmail.com>
In-Reply-To: <YrwX2U48HOC+UF07@myrica>
Cc: jroedel@suse.de, iommu@lists.linux.dev, rafael@kernel.org,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 iommu@lists.linux-foundation.org, lenb@kernel.org
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

Hi Jean

On 6/29/22 11:14, Jean-Philippe Brucker wrote:
> Hi Eric,
> 
> On Mon, Jun 27, 2022 at 02:55:34PM +0200, Eric Auger wrote:
>> Currently acpi_viot_init() gets called after the pci
>> device has been scanned and pci_enable_acs() has been called.
>> So pci_request_acs() fails to be taken into account leading
>> to wrong single iommu group topologies when dealing with
>> multi-function root ports for instance.
>>
>> We cannot simply move the acpi_viot_init() earlier, similarly
>> as the IORT init because the VIOT parsing relies on the pci
>> scan. However we can detect VIOT is present earlier and in
>> such a case, request ACS. Introduce a new acpi_viot_early_init()
>> routine that allows to call pci_request_acs() before the scan.
>>
>> Fixes: 3cf485540e7b ("ACPI: Add driver for the VIOT table")
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Reported-by: Jin Liu <jinl@redhat.com>
> 
> Thanks for the fix, the patch makes sense and fixes the issue.
> 
> I wondered whether we should keep the logic where we only request ACS if
> an IOMMU is found to manage a PCI range, but I can't see any harm in
> requesting it regardless (plus there is a precedent with AMD IOMMU).
Yes that's what I saw too
> I could imagine some VMM wanting to only put an IOMMU in front of its MMIO
> devices and leave PCI to roam free, but that seems like a stretch.
> 
> There is another issue with the existing code, though: we can't call
> pci_request_acs() when CONFIG_PCI is disabled because no stub is defined.
> Could you wrap the call in an #ifdef?
sure
> 
>> ---
>>  drivers/acpi/bus.c        |  1 +
>>  drivers/acpi/viot.c       | 23 +++++++++++++++++------
>>  include/linux/acpi_viot.h |  2 ++
>>  3 files changed, 20 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
>> index 86fa61a21826..906ad8153fd9 100644
>> --- a/drivers/acpi/bus.c
>> +++ b/drivers/acpi/bus.c
>> @@ -1400,6 +1400,7 @@ static int __init acpi_init(void)
>>  
>>  	pci_mmcfg_late_init();
>>  	acpi_iort_init();
>> +	acpi_viot_early_init();
>>  	acpi_hest_init();
>>  	acpi_ghes_init();
>>  	acpi_scan_init();
>> diff --git a/drivers/acpi/viot.c b/drivers/acpi/viot.c
>> index d2256326c73a..3c1be123e4d6 100644
>> --- a/drivers/acpi/viot.c
>> +++ b/drivers/acpi/viot.c
>> @@ -248,6 +248,23 @@ static int __init viot_parse_node(const struct acpi_viot_header *hdr)
>>  	return ret;
>>  }
>>  
>> +/**
>> + * acpi_viot_early_init - Test the presence of VIOT and enable ACS
>> + *
>> + * If the VIOT does exist, ACS must be enabled. This cannot be
>> + * done in acpi_viot_init() which is called after the bus scan
>> + */
>> +void __init acpi_viot_early_init(void)
>> +{
>> +	acpi_status status;
>> +	struct acpi_table_header *hdr;
>> +
>> +	status = acpi_get_table(ACPI_SIG_VIOT, 0, &hdr);
>> +	if (!ACPI_FAILURE(status))
>> +		pci_request_acs();
>> +	acpi_put_table(hdr);
> 
> I'd rather not call acpi_put_table() in case of failure. I know it is
> handled but it looks fragile and I couldn't find any other user of
> acpi_get_table() doing this.
OK
> 
>> +}
>> +
>>  /**
>>   * acpi_viot_init - Parse the VIOT table
>>   *
>> @@ -319,12 +336,6 @@ static int viot_pci_dev_iommu_init(struct pci_dev *pdev, u16 dev_id, void *data)
>>  			epid = ((domain_nr - ep->segment_start) << 16) +
>>  				dev_id - ep->bdf_start + ep->endpoint_id;
>>  
>> -			/*
>> -			 * If we found a PCI range managed by the viommu, we're
>> -			 * the one that has to request ACS.
>> -			 */
>> -			pci_request_acs();
>> -
>>  			return viot_dev_iommu_init(&pdev->dev, ep->viommu,
>>  						   epid);
>>  		}
>> diff --git a/include/linux/acpi_viot.h b/include/linux/acpi_viot.h
>> index 1eb8ee5b0e5f..e58d60f8ff2e 100644
>> --- a/include/linux/acpi_viot.h
>> +++ b/include/linux/acpi_viot.h
>> @@ -6,10 +6,12 @@
>>  #include <linux/acpi.h>
>>  
>>  #ifdef CONFIG_ACPI_VIOT
>> +void __init acpi_viot_early_init(void);
>>  void __init acpi_viot_init(void);
>>  int viot_iommu_configure(struct device *dev);
>>  #else
>>  static inline void acpi_viot_init(void) {}
>> +static inline void acpi_viot_early_init(void) {}
> 
> nit: different declaration order
OK

Thanks

Eric
> 
> Thanks,
> Jean
> 
> 
>>  static inline int viot_iommu_configure(struct device *dev)
>>  {
>>  	return -ENODEV;
>> -- 
>> 2.35.3
>>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
