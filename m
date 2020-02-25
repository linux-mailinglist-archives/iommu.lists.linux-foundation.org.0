Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B9D16BD38
	for <lists.iommu@lfdr.de>; Tue, 25 Feb 2020 10:25:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1089D8620F;
	Tue, 25 Feb 2020 09:25:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sN50dfPwtV5M; Tue, 25 Feb 2020 09:25:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1C30F863E8;
	Tue, 25 Feb 2020 09:25:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 07E52C18DA;
	Tue, 25 Feb 2020 09:25:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A1B0BC18DA
 for <iommu@lists.linux-foundation.org>; Tue, 25 Feb 2020 09:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 90B97863BE
 for <iommu@lists.linux-foundation.org>; Tue, 25 Feb 2020 09:25:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tnIPwtz21biI for <iommu@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 09:25:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9D98D86416
 for <iommu@lists.linux-foundation.org>; Tue, 25 Feb 2020 09:25:28 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id p9so2203419wmc.2
 for <iommu@lists.linux-foundation.org>; Tue, 25 Feb 2020 01:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xXjKrsLdZZ8wwVwaLKEsCAigMvn6xhJRvLjeY9bym8I=;
 b=xSQI/AECo2FF/n1rzar450UsJu6LS++K752YYamCvDgC3gmDDtm//+VyDKm1Kbo2U6
 UGZi3S+eGAsV0JhiWc2Y+ce9bAn+BhCUIiuI6B59vwHIUTq6SUXNmlTzd15+Ahi5vRFG
 ukAPDmTylaGIN6SKk9F1PWSiE0RSVvcWjauHpIV3567yMuNz7dwqRHqE/6rGd5/HRMTP
 eH8jduDDQ5OHpK9lVCEJlTuHYN+7fQfK4nUzE+8LOZ/Mm/LwrJnTJ2SDMtvUVs3fepv6
 tBSVxhhsDR+XbgoksqEMbEYIIMKi+cx4SZ96EM24GLhZV/KdTnpP6eY2JcEYDfuCgCzQ
 cgpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xXjKrsLdZZ8wwVwaLKEsCAigMvn6xhJRvLjeY9bym8I=;
 b=N4ckYM8s6gSzKvBpKU4mD5dmTIorhfg4sIlnXwniwkdcqQOzDINgS7payBOiXp49zQ
 EyzN2cpQYJpI/b/obowWs4SNdygDixeZp6l7JPnIraVzVoQvN6Qdb/GPqmgh0Wv8UQIP
 z+WRpfWEx52inTkMV06DaeTIB3/4kptv5hvvU67dxGd2kUqgN8AudrAFgSG7b513EfUz
 zPvlHgpQhYWUEkuC2ERDV+h8kS0OzRr27sP/5xiYqFGIwTOwvOgn56mYmBXALngVP3FA
 fX3JiftZzqgCVlhb69y0TKLEIi/kp3QbcL8nb6NPdhM1wb5bEJUmslKPn4d/vNcce+sg
 ZobA==
X-Gm-Message-State: APjAAAVORKPNQaqk2Ka8xTPDmkpwj5F0IpAmajRUmmwkh+IyteSSbSTh
 sFzQAMR0qrQTwcBV40mLuJm0GQ==
X-Google-Smtp-Source: APXvYqyRPbcxq+DpGxqy4QJ4Y+9sIc/9udtBlHtjdqBZpekzFx+Ms4VTHLdlkurRNx5P5V2Nn5l0Xg==
X-Received: by 2002:a7b:c204:: with SMTP id x4mr4229923wmi.20.1582622727153;
 Tue, 25 Feb 2020 01:25:27 -0800 (PST)
Received: from myrica ([2001:171b:c9a8:fbc0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id x21sm3115712wmi.30.2020.02.25.01.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 01:25:26 -0800 (PST)
Date: Tue, 25 Feb 2020 10:25:19 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Xu Zaibo <xuzaibo@huawei.com>
Subject: Re: [PATCH v4 03/26] iommu: Add a page fault handler
Message-ID: <20200225092519.GC375953@myrica>
References: <20200224182401.353359-1-jean-philippe@linaro.org>
 <20200224182401.353359-4-jean-philippe@linaro.org>
 <cb8b5a85-7f1a-8eb7-85bd-db2f553f066d@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cb8b5a85-7f1a-8eb7-85bd-db2f553f066d@huawei.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, kevin.tian@intel.com,
 will@kernel.org, Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
 linux-pci@vger.kernel.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, robh+dt@kernel.org, catalin.marinas@arm.com,
 zhangfei.gao@linaro.org, robin.murphy@arm.com, christian.koenig@amd.com,
 linux-arm-kernel@lists.infradead.org
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

Hi Zaibo,

On Tue, Feb 25, 2020 at 11:30:05AM +0800, Xu Zaibo wrote:
> > +struct iopf_queue *
> > +iopf_queue_alloc(const char *name, iopf_queue_flush_t flush, void *cookie)
> > +{
> > +	struct iopf_queue *queue;
> > +
> > +	queue = kzalloc(sizeof(*queue), GFP_KERNEL);
> > +	if (!queue)
> > +		return NULL;
> > +
> > +	/*
> > +	 * The WQ is unordered because the low-level handler enqueues faults by
> > +	 * group. PRI requests within a group have to be ordered, but once
> > +	 * that's dealt with, the high-level function can handle groups out of
> > +	 * order.
> > +	 */
> > +	queue->wq = alloc_workqueue("iopf_queue/%s", WQ_UNBOUND, 0, name);
> Should this workqueue use 'WQ_HIGHPRI | WQ_UNBOUND' or some flags like this
> to decrease the unexpected
> latency of I/O PageFault here? Or maybe, workqueue will show an uncontrolled
> latency, even in a busy system.

I'll investigate the effect of these flags. So far I've only run on
completely idle systems but it would be interesting to add some
workqueue-heavy load in my tests.

Thanks,
Jean
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
