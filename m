Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1E02E18E
	for <lists.iommu@lfdr.de>; Wed, 29 May 2019 17:49:41 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C57CB26DC;
	Wed, 29 May 2019 15:49:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C8661268B
	for <iommu@lists.linux-foundation.org>;
	Wed, 29 May 2019 15:43:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7CB73821
	for <iommu@lists.linux-foundation.org>;
	Wed, 29 May 2019 15:43:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4905A3082B71;
	Wed, 29 May 2019 15:43:15 +0000 (UTC)
Received: from [10.36.116.67] (ovpn-116-67.ams2.redhat.com [10.36.116.67])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 43C75272BB;
	Wed, 29 May 2019 15:43:09 +0000 (UTC)
From: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH v5 3/7] iommu/vt-d: Introduce is_downstream_to_pci_bridge
	helper
To: Christoph Hellwig <hch@infradead.org>
References: <20190528115025.17194-1-eric.auger@redhat.com>
	<20190528115025.17194-4-eric.auger@redhat.com>
	<20190529062125.GC26055@infradead.org>
Message-ID: <f8edf6af-0c67-0e31-d28c-731e77f22a29@redhat.com>
Date: Wed, 29 May 2019 17:43:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190529062125.GC26055@infradead.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Wed, 29 May 2019 15:43:23 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: alex.williamson@redhat.com, jean-philippe.brucker@arm.com,
	dwmw2@infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, robin.murphy@arm.com,
	eric.auger.pro@gmail.com
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

Hi Christoph,

On 5/29/19 8:21 AM, Christoph Hellwig wrote:
>> +/* is_downstream_to_pci_bridge - test if a device belongs to the
>> + * PCI sub-hierarchy of a candidate PCI-PCI bridge
>> + *
>> + * @dev: candidate PCI device belonging to @bridge PCI sub-hierarchy
>> + * @bridge: the candidate PCI-PCI bridge
>> + *
>> + * Return: true if @dev belongs to @bridge PCI sub-hierarchy
>> + */
> 
> This is not valid kerneldoc comment.  Try something like this:
> 
> /**
>  * is_downstream_to_pci_bridge - test if a device belongs to the PCI
>  *				 sub-hierarchy of a candidate PCI-PCI bridge
>  * @dev: candidate PCI device belonging to @bridge PCI sub-hierarchy
>  * @bridge: the candidate PCI-PCI bridge
>  *
>  * Returns true if @dev belongs to @bridge PCI sub-hierarchy, else false.
>  */
> 
Sure,

just replaced Returns by Return:

Thanks

Eric
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
